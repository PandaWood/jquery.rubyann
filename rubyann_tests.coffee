# detabify - remove tabs, convenience function
String.prototype.detabify = ->
	@replace(/\s*/g, '').toLowerCase()

BirdRubyXml = "bird=<ruby><rb>鳥</rb><rp>(</rp><rt>とり</rt><rp>)</rp></ruby>"

module "Finding"
test 'should annotate 1 kanji with 2 hiragana', ->
	$('#1kanji_2hiragana').rubyann()
	equals $('#1kanji_2hiragana').html().detabify(), BirdRubyXml, 'ruby xml is generated'

test "finds nothing - no ruby xml", ->
	$('#nothing').rubyann()
	equals $('#nothing').html(), 'no delimiters here', 'ruby xml is not generated'

test "finds delimiters but no comma - no ruby xml", ->
	$('#empty_braces').rubyann()
	equals $('#empty_braces').html(), 'delimiters found but {no comma within}', 'ruby xml is not generated'

test "finds delimiters & comma but no characters", ->
	$('#no_characters').rubyann()
	equals $('#no_characters').html(), 'no characters {,}', 'ruby xml is not generated'

test "should annotate multiple furigana", ->
	$('#multiple_furigana').rubyann()
	equals $('#multiple_furigana').html().detabify(), 'japanese_language:<ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>', 	'ruby xml is generated'

test "use @ as delimiter", ->
	$('#delimiter_at').rubyann delimiters:'@@'
	equals $('#delimiter_at').html().detabify(), BirdRubyXml, 'ruby xml is not generated'

test "use [] as delimiters", ->
	$('#delimiter_squarebrackets').rubyann delimiters:'[]'
	equals $('#delimiter_squarebrackets').html().detabify(), BirdRubyXml, 'ruby xml is not generated'

test "invalid delimiters args", ->
	$('#do_nothing').rubyann delimiters:'['
	equals $('#do_nothing').html(), 'bird=[鳥,とり]', 'nothing is done because delimiters args is invalid'

# this test added because code originally used .text() which needed to be replaced by .html()
test "embedded html works", ->
	$('#embedded_html').rubyann()
	equals $('#embedded_html').html().detabify(), "<ol><li>#{BirdRubyXml}</li></ol>", 'no html is lost'
