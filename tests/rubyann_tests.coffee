# detabify - remove tabs, convenience function
String.prototype.detabify = ->
	@replace(/\s*/g, '').toLowerCase()

BirdRubyXml = "bird=<ruby><rb>鳥</rb><rp>(</rp><rt>とり</rt><rp>)</rp></ruby>"

QUnit.module 'Finding'

QUnit.test 'annotate 1 kanji with 2 hiragana', (assert) ->
	$('#1kanji_2hiragana').rubyann()
	assert.equal $('#1kanji_2hiragana').html().detabify(), BirdRubyXml, 'ruby xml is generated'

QUnit.test "no delimiters at all", (assert) -> #ts
	$('#nothing').rubyann()
	assert.equal $('#nothing').html(), 'no delimiters here', 'ruby xml is not generated'

QUnit.test "delimiters but no comma separating rubybase/rubytext", (assert) ->
	$('#empty_braces').rubyann()
	assert.equal $('#empty_braces').html(), 'delimiters found but {no comma within}', 'ruby xml is not generated'

QUnit.test "delimiters & comma but no characters", (assert) ->
	$('#no_characters').rubyann()
	assert.equal $('#no_characters').html(), 'no characters {,}', 'ruby xml is not generated'

QUnit.test "annotate multiple furigana", (assert) ->
	$('#multiple_furigana').rubyann()
	assert.equal $('#multiple_furigana').html().detabify(), 'japanese_language:<ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>', 	'ruby xml is generated'

QUnit.test "use @@ as delimiters", (assert) ->
	$('#delimiter_at').rubyann delimiters:'@@'
	assert.equal $('#delimiter_at').html().detabify(), BirdRubyXml, 'ruby xml is generated'

QUnit.test "use [] as delimiters", (assert) ->
	$('#delimiter_squarebrackets').rubyann delimiters:'[]'
	assert.equal $('#delimiter_squarebrackets').html().detabify(), BirdRubyXml, 'ruby xml is generated'

QUnit.test "invalid delimiters arg", (assert) ->
	$('#do_nothing').rubyann delimiters:'['
	assert.equal $('#do_nothing').html(), 'bird=[鳥,とり]', 'nothing is done because delimiters arg is invalid'

# this test added because code originally used $(this).text() (which should have been $(this).html()
QUnit.test "embedded html works", (assert) ->
	$('#embedded_html').rubyann()
	assert.equal $('#embedded_html').html().detabify(), "<ol><li>#{BirdRubyXml}</li></ol>", 'no html is lost'

QUnit.test "annotate with selector that processes > 1 element", (assert) ->
	$('.multi_div').rubyann()
	assert.equal $('#multidiv1').html().detabify(), "multidiv1,#{BirdRubyXml}", 'ruby xml is generated'
	assert.equal $('#multidiv2').html().detabify(), "multidiv2,#{BirdRubyXml}", 'ruby xml is generated'
