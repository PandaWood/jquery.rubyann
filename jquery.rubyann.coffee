$ = jQuery

baseXml = 
'<ruby>
	<rb>{rbase}</rb>
	<rp>(</rp>
	<rt>{rtext}</rt>
	<rp>)</rp>
</ruby>'

$.fn.extend({
	rubyann: (options) ->
		defaults =
			delimiters: '{}'

		options = $.extend defaults, options
		return if options.length is not 2
		delimitStart = "\\#{options.delimiters[0]}"
		delimitEnd = "\\#{options.delimiters[1]}"

		@each ->
			storyText = $(@).text()
			matches = storyText.match ///
					#{delimitStart}.*?,.*?#{delimitEnd}
				///g
			return @ if matches is null

			$.each matches, (index,value) ->
				split = value.split ','
				return if split.length isnt 2

				rbase = split[0].replace options.delimiters[0],''
				rtext = split[1].replace options.delimiters[1],''
				return if rbase.length is 0 or rtext.length is 0
				
				rxml = baseXml.replace('{rbase}', rbase)
				              .replace('{rtext}', rtext)
				storyText = storyText.replace value, rxml

			$(@).html storyText
})