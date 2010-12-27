$ = jQuery
$.fn.extend({
	rubyann: ->
		baseXml = '<ruby><rb>{rbase}</rb><rp>(</rp><rt>{rtext}</rt><rp>)</rp></ruby>'
		annotationRegex = /\{.*\}/g
		@each ->
			storyText = $(@).text()
			userAnnotations = annotationRegex.exec storyText
			return $(@) if userAnnotations is null

			$.each userAnnotations, (index,value) ->
				split = value.split ','
				return $(@) if split.length isnt 2

				rbase = split[0].replace '{',''
				rtext = split[1].replace '}',''
				rxml = baseXml.replace('{rbase}', rbase).replace('{rtext}', rtext)
				storyText = storyText.replace value, rxml

			$(@).html storyText
})