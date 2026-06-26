// Runs the QUnit suite in Node using a simulated DOM (jsdom) — no browser needed.
// Loads the test fixtures from rubyann_tests.html, then the plugin and the
// compiled tests, and reports pass/fail with a non-zero exit code on failure.

const path = require('path')
const { JSDOM } = require('jsdom')

;(async () => {
	// Reuse the fixture markup from the browser test page (scripts not executed).
	const dom = await JSDOM.fromFile(path.join(__dirname, 'rubyann_tests.html'), {
		runScripts: 'outside-only'
	})
	const { window } = dom
	window.scrollTo = () => {}   // QUnit calls this when done; jsdom has no real viewport

	global.window = window
	global.document = window.document
	global.navigator = window.navigator

	// require('jquery') returns jQuery already bound to the global window when one
	// exists, otherwise a factory — handle both.
	const jq = require('jquery')
	const $ = jq.fn ? jq : jq(window)
	global.$ = global.jQuery = window.$ = window.jQuery = $

	const QUnit = require('qunit')
	global.QUnit = QUnit
	QUnit.config.autostart = false

	require('../dist/jquery.rubyann.js')   // plugin under test (extends $.fn)
	require('../js/rubyann_tests.js')      // compiled test suite

	QUnit.testDone(({ name, failed, total }) => {
		console.log(`  ${failed ? 'FAIL' : 'pass'}  ${name} (${total - failed}/${total})`)
	})
	QUnit.on('runEnd', data => {
		const { passed, failed, total } = data.testCounts
		console.log(`\n${passed}/${total} tests passed, ${failed} failed`)
		process.exit(failed > 0 ? 1 : 0)
	})

	QUnit.start()
})().catch(err => {
	console.error(err)
	process.exit(1)
})
