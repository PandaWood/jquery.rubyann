$ = jQuery

baseXml = 
'<ruby>
	<rb>$2</rb>
	<rp>(</rp>
	<rt>$3</rt>
	<rp>)</rp>
</ruby>'

$.fn.extend {}=
	rubyann: (options) ->

		settings = delimiters: '{}'
		options = $.extend settings, options
		return if options.delimiters.length isnt 2

		startChar = "\\#{options.delimiters[0]}"
		endChar = "\\#{options.delimiters[1]}"
		regex = ///#{startChar}((\S+?),(\S+?))#{endChar}///g

		@each ->
			html = $(@).html()
			newHtml = html.replace regex, baseXml
			$(@).html(newHtml) if newHtml isnt html
			