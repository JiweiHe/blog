重定向
=========

1.重定向输出
    
    ls -l /usr/bin > ls-output.txt
    > ls-output.txt 没有命令在>之前，会删除已有文件内容或创建一个新的空文件
    ls -l /usr/bin >> ls-output.txt 追加文件内容
    ls -l /bin/usr &> ls-output.txt 联合重定向（包含标准输出和错误）

2.不必要输出

    ls -l /bin/usr 2> /dev/null

3.cat - 连接文件

    cat [file]
    cat file1 file2 file3 将文件连接在一起

4.管道

    一个命令的输出可以作为另外一个命令的输入，如:ls test.txt | mv test.txt test/test.txt

5.过滤器

    1.sort : 对结果排序 eg: ls /usr | sort
    2.uniq : 默认是过滤掉重复行， 加上-d 表示查出重复的行    ls /bin /usr/bin | sort | uniq
    3.wc : 命令用来显示文件所包含的行，字，字节数  加上-l 参数 只是输出行
    4.grep: 正则匹配

6.head / tail - 打印文件开头部分/结尾部分

    head -n 5 ls-output.txt
    tail -n 5 ls-output.txt
    tail -f ls-output.txt -n 200 实时检测文件

7.tee － 从 Stdin 读取数据，并同时输出到 Stdout 和文件

    1.tee 程序从标准输入读入数据，并且同时复制数据 到标准输出（允许数据继续随着管道线流动）和一个或多个文件。
    2.ls /usr/bin | tee ls.txt | grep zip
