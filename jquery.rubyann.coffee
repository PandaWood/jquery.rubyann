$ = jQuery

baseXml = 
'<ruby>
	<rb>{rbase}</rb>
	<rp>(</rp>
	<rt>{rtext}</rt>
	<rp>)</rp>
</ruby>'

$.fn.extend({
	rubyann: ->
		@each ->
			storyText = $(@).text()
			matches = storyText.match(/\{.*?,.*?\}/g)
			return @ if matches is null

			$.each matches, (index,value) ->
				split = value.split ','
				return if split.length isnt 2

				rbase = split[0].replace '{',''
				rtext = split[1].replace '}',''
				return if rbase.length is 0 or rtext.length is 0
				
				rxml = baseXml.replace('{rbase}', rbase)
				              .replace('{rtext}', rtext)
				storyText = storyText.replace value, rxml

			$(@).html storyText
})