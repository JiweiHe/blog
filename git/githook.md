githook
========

1.概述:
    Git钩子是仓库中特定的事件发生时Git自动执行的脚本。

2.安装钩子:
    在每个项目中git 初始化后,会生成.git文件夹，下面有一个hooks文件夹，每个文件实际上对应了一个钩子,文件夹中已经包含了大部分的钩子了。后缀名.sample是为了防止默认被执行。如要创建一个pre-push的钩子,只需要把pre-push.sample的后缀名去掉即可。

3.脚本语言:
    内置脚本大多数是shell和PERL语言的，而你自己也可以使用其他的脚本语言，只要在脚本的开头指明解析器的路径即可。

    #!/usr/bin/env python
    import sys, os

    commit_msg_filepath = sys.argv[1]
    with open(commit_msg_filepath, 'w') as f:
    f.write("# Please include a useful commit message!")

4.钩子的作用域:
    钩子存在本地，不会随着git clone一起复制到新的仓库。因为.git/hooks 目录不随着项目一起拷贝，也不受版本控制的影响。若需要共享则可以在.git/hooks 中创建软连接，链接到钩子实际存放的位置.

5.本地钩子:

    pre-commit
    prepare-commit-msg
    commit-msg
    post-commit
    post-checkout
    pre-rebase

所有带pre-的钩子允许你修改即将发生的操作，而带post-的钩子只能用于通知

    pre-commit
    
