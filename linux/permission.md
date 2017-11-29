linux 权限
======

id - 显示用户身份号

      ~ id
            uid=501(mike) gid=20(staff) groups=20(staff),701(com.apple.sharepoint.group.1),12(everyone),61(localaccounts),79(_appserverusr),80(admin),81(_appserveradm),98(_lpadmin),33(_appstore),100(_lpoperator),204(_developer),395(com.apple.access_ftp),398(com.apple.access_screensharing),399(com.apple.access_ssh)

读取，写入，和执行
    
    ➜  ~ > test.txt
    ➜  ~ ll test.txt
    -rw-r--r--  1 mike  staff     3B  2  5 21:16 test.txt

前十个字符是文件的属性，第一个字符表明文件类型
    
    属性  文件类型
    -   一个普通文件
    d   一个目录
    l   一个符号链接。注意对于符号链接文件，剩余的文件属性总是"rwxrwxrwx"，而且都是 虚拟值。真正的文件属性是指符号链接所指向的文件的属性。
    c   一个字符设备文件。这种文件类型是指按照字节流，来处理数据的设备。 比如说终端机，或者调制解调器
    b   一个块设备文件。这种文件类型是指按照数据块，来处理数据的设备，例如一个硬盘，或者 CD-ROM 盘。

剩下的九个字符叫做文件模式，代表着文件所有者，文件组所有者，和其他人的读写执行权限

权限属性:

    属性      文件                      目录
    r       允许打开并读取文件内容       允许列出目录中的内容，前提是目录必须设置了可执行属性
    w       允许写入文件内容或截断文件。但是不允许对文件进行重命名或删除，重命名或删除是有目录的属性决定的。    允许在目录下新建，删除或重命名文件，前提是目录必须设置了可执行权限
    x       允许将文件作为程序来执行，使用脚本语言编写的程序必须设置为可读才能被执行    允许进入目录，如：cd directory


chmod - 更改文件模式

    常用的映射关系:7 (rwx)，6 (rw-)，5 (r-x)，4 (r--)，和 0 (---)。

umask - 设置默认的文件权限

    创建文件时默认给予的权限
    umask 值为八进制

