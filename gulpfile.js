const gulp = require('gulp');
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const uglify = require('gulp-uglify');
const concat = require('gulp-concat');
const babel = require('gulp-babel');
const watch = require('gulp-watch');
const browserSync = require('browser-sync');
const reload = browserSync.reload;
var webpackStream = require('webpack-stream');
var webpack2 = require('webpack');
const shell = require('gulp-shell')



gulp.task('default', ['styles', 'webpack'], () => {
  gulp.watch('./assets/sass/**/*', ['styles']);
  gulp.watch('./assets/js/**/*', ['webpack']);
});


gulp.task('styles', () => {
  gulp.src('assets/sass/**/*.scss')
    .pipe(
      sass({
        outputStyle: 'compressed',
      })
      .on('error', sass.logError))
    .pipe(autoprefixer({
      browsers: ['last 2 versions'],
    }))
    .pipe(gulp.dest('./public/css'))
    // .pipe(browserSync.stream());
});

gulp.task('webpack', shell.task([
  'webpack'
]))
