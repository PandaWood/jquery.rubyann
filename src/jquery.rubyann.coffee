
$.fn.extend {} =
	rubyann: (options) ->

		settings = delimiters: '{}'
		options = $.extend settings, options
		return if options.delimiters.length isnt 2		#fail silently when configured badly (will almost certainly be a dev mistake)

		startChar = "\\#{options.delimiters[0]}"
		endChar = "\\#{options.delimiters[1]}"
		regex = ///#{startChar}((\S+?),(\S+?))#{endChar}///g		# construct the regex - the guts of the search/replace operation that rubyann basically is

		@each ->
			html = $(@).html()
			newHtml = html.replace regex, '<ruby>
																			<rb>$2</rb>
																			<rp>(</rp>
																			<rt>$3</rt>
																			<rp>)</rp>
																		 </ruby>'
			$(@).html(newHtml) if newHtml isnt html		#avoid modifying DOM if no ruby syntax found (ie nothing to do)
			