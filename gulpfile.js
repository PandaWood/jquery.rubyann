// rubyann build

const gulp = require('gulp')
const coffee = require('gulp-coffee')
const qunit = require('gulp-qunit')
const uglify = require('gulp-uglify')

// transpile coffee src
gulp.task('coffee', function() {
	gulp.src('src/*.coffee')
		.pipe(coffee())
		.pipe(uglify())
		.pipe(gulp.dest('dist'))
})

// transpile test coffee and run qunit tests
gulp.task('test', function() {
	gulp.src('tests/*.coffee')
		.pipe(coffee())
		.pipe(gulp.dest('./js'))

	gulp.src('tests/rubyann_tests.html')
		.pipe(qunit())
})

gulp.task('default', ['coffee', 'test'])