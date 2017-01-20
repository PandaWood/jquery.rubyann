// rubyann build

var gulp = require('gulp')
var coffee = require('gulp-coffee')
var qunit = require('gulp-qunit')
var uglify = require('gulp-uglify')

gulp.task('coffee', function() {

	gulp.src('./src/*.coffee')
		.pipe(coffee())
		.pipe(uglify())
		.pipe(gulp.dest('./dist'))

})


gulp.task('test', function() {

	gulp.src('./tests/*.coffee')
		.pipe(coffee())
		.pipe(gulp.dest('./js'))

	gulp.src('./tests/rubyann_tests.html')
		.pipe(qunit())

})

gulp.task('default', ['coffee', 'test'])