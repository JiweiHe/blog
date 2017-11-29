webpack 学习
==========

1.什么是webpack?

webpack 是一个模块的打包器。它将根据模块的依赖关系进行静态分析,然后将这些模块按照指定的规则生成对应的静态资源。

2.webpack 安装

    npm install webpack -g

通常也会将webpack安装到项目的依赖中。

    npm install webpack --save-dev

3.webpack的使用

创建静态文件index.html和一个js入口文件entry.js

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <title>webpack demo</title>
    </head>

    <body>
        <script type="text/javascript" src="js/bundle.js"></script>
    </body>
    </html>

编译entry.js 并打包到bundle.js:

    webpack entry.js bundle.js

观察bundle.js的内容变化

接下来添加一个模块 module.js 在entry.js里使用该模块

重新打包bundle.js, 观察bundle.js的内容变化

webpack会分析入口文件，解析包含依赖关系的各个文件，这些文件都打包到了bundle.js.webpack 会给每个模块分配一个唯一的id并且通过这个id索引和访问模块。在页面启动时，会先执行entry.js中的代码，其他模块会在运行require的时候再执行