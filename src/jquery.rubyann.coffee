RUBY_ANN_TEMPLATE =
'<ruby>
	<rb>$2</rb>
	<rp>(</rp>
	<rt>$3</rt>
	<rp>)</rp>
</ruby>'

$.fn.extend {} =
	rubyann: (options) ->

		settings = delimiters: '{}'
		options = $.extend settings, options
		return if options.delimiters.length isnt 2		#fail silently when configured badly (likely dev mistake)

		startChar = "\\#{options.delimiters[0]}"
		endChar = "\\#{options.delimiters[1]}"
		regex = ///#{startChar}((\S+?),(\S+?))#{endChar}///g		# construct regex - guts of search/replace operation that rubyann basically is

		@each ->
			$this = $(@)
			html = $this.html()
			newHtml = html.replace regex, RUBY_ANN_TEMPLATE
			$this.html(newHtml) if newHtml isnt html		#avoid modifying DOM if no ruby syntax found (ie nothing to do)
			