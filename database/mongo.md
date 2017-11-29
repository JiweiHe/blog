mongo（mongoV3.4）
======

一：Mongo writeConcern

    1.w: 数据写入到number个节点才向用客户端确认
        {w: 0} 对客户端的写入不需要发送任何确认，适用于性能要求高，但不关注正确性的场景
        {w: 1} 默认的writeConcern，数据写入到Primary就向客户端发送确认
        {w: “majority”} 数据写入到副本集大多数成员后向客户端发送确认，适用于对数据安全性要求比较高的场景，该选项会降低写入性能
    2.j: 写入操作的journal持久化后才向客户端确认 
        默认为”{j: false}，如果要求Primary写入持久化了才向客户端确认，则指定该选项为true
    3.wtimeout: 写入超时时间，仅w的值大于1时有效。
        当指定{w: }时，数据需要成功写入number个节点才算成功，如果写入过程中有节点故障，可能导致这个条件一直不能满足，从而一直不能向客户端发送确认结果，针对这种情况，客户端可设置wtimeout选项来指定超时时间，当写入过程持续超过该时间仍未结束，则认为写入失败。

二：Mongo readConcern 与 readPreference

    1. readPreference 主要用于控制客户端Driver 从复制集的哪个节点读取数据，这个特性可方便实现读写分离。就近读取等策略。

        * primary 只从primary节点读数据，这个是默认设置
        * primaryPreferred  优先从 primary 读取，primary 不可服务，从 secondary 读
        * secondary 只从 scondary 节点读数据
        * secondaryPreferred 优先从 secondary 读取，没有 secondary 成员时，从 primary 读取
        * nearest 根据网络距离就近读取

    2.readConcern 决定到某个读取数据时，能读到什么样的数据。

        * local 能读取任意数据，默认设置
        * majority 只能读取到成功些人大多数节点的数据
        * linearizable 一定能读到 WriteConcern 为 majority，并且在读操作之前确认。

三: Mongo 复制集

    1.复制是将数据同步在多个服务器的过程。
        保障数据的安全性
        数据高可用性
        灾难恢复
        无需停机维护
        分布式读取数据

    2.副本集的特征.
        N个节点的集群
        任何节点可作为主节点
        所有写入操作都在主节点上
        自动故障转移
        自动恢复

