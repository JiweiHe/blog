gulp 入门
======

1.全局安装gulp:

    $ npm install --global gulp

2.作为项目的开发依赖安装:

    $ npm install --save-dev gulp

3.在项目根目录下创建一个名为gulpfile.js的文件,当执行gulp命令时会读取该文件:

    var gulp = require('gulp');//加载gulp模块

    gulp.task('default', function() {
        //默认执行名称为default 的task
    });

4.运行gulp:

    $ gulp

或者如果想单独执行某个特殊的task,则gulp <task> <task>


gulp API
========

1.gulp.src(globs[, options])

输出符合所提供的匹配模式(glob)或者匹配模式的数组的文件。返回一个Vinyl files(一种虚拟文件格式,能够很方便的匹配文件并读取出来（stream或buffer）) 的 stream 它可以被piped到别的插件中。

    gulp.src('client/templates/*.jade')//括号里的表达式可以转成Vinyl Stream ,
        .pipe(jade())
        .pipe(minify())
        .pipe(gulp.dest('build/minified_templates'));

2.gulp.dest(globs[, options])

     dest接口接收Vinyl Stream 转成文件输出,文件不存在时创建

3.gulp.task(name[, deps], fn)

    gulp.task('taskname', function() {
            //task 需要做的事情
        });
    deps 代表一些需要在你当前任务完成之前完成

4.
gulp.watch(glob[, opts], task)

    var watcher = gulp.watch('js/**/*.js', ['uglify', 'reload']);
    watcher.on('change', function(event){
        console.log('file change .....');
    });

gulp.watch(glob[, opts, cb])

    gulp.watch('js/**/*.js', function(event) {
        console.log('1111');//每次改动都执行
    });





