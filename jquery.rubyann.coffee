$ = jQuery

baseXml = 
'<ruby>
	<rb>$2</rb>
	<rp>(</rp>
	<rt>$3</rt>
	<rp>)</rp>
</ruby>'

$.fn.extend({
	rubyann: (options) ->
		defaults = delimiters: '{}'
		options = $.extend defaults, options
		return if options.delimiters.length isnt 2
		delimitBeg = "\\#{options.delimiters[0]}"
		delimitEnd = "\\#{options.delimiters[1]}"
		regex = ///#{delimitBeg}((\S+?),(\S+?))#{delimitEnd}///g

		@each ->
			html = $(@).html()
			newHtml = html.replace regex, baseXml
			$(@).html(newHtml) if newHtml isnt html
})