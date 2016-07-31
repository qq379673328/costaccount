var gulp = require('gulp');
var jshint = require('gulp-jshint');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var clean = require('gulp-clean');

// 语法检查
gulp.task('jshint', function () {
    return gulp.src('js/**/*.js')
        .pipe(jshint())
        .pipe(jshint.reporter('default'));
});

//js 合并压缩
gulp.task('minify', function (){
     return gulp.src([
                      'js/app/**/*.js',
                      '!js/app/components/3rd/**/*.js',
                      '!js/app/bower_components/**/*.js',
                      '!js/app/appformlist.js'])
        .pipe(concat('main.js'))
        .pipe(gulp.dest('js/build'))
        .pipe(uglify())
        .pipe(rename('main.min.js'))
        .pipe(gulp.dest('js/build'));
});

//清空发布
gulp.task('clean', function () {
	gulp.src(['js/build/**'], {read: false}).pipe(clean());
});

// 监视文件的变化
gulp.task('watch', function () {
    gulp.watch(['js/**/*.js'],['minify']);
});

// 注册缺省任务
gulp.task('default', ['clean', 'minify', 'watch']);
