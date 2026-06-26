RUBY_ANN_TEMPLATE = '<ruby><rb>$1</rb><rp>(</rp><rt>$2</rt><rp>)</rp></ruby>'

$.fn.rubyann = (options) ->
	settings = delimiters: '{}'
	options = $.extend settings, options
	return @ if options.delimiters.length isnt 2   # fail silently when misconfigured (likely a dev mistake)

	# escape each delimiter so any character is treated literally in the regex
	[open, close] = (ch.replace /[.*+?^${}()|[\]\\]/g, '\\$&' for ch in options.delimiters)
	regex = ///#{open}(\S+?),(\S+?)#{close}///g   # the search/replace that rubyann basically is

	@each ->
		$this = $(@)
		html = $this.html()
		newHtml = html.replace regex, RUBY_ANN_TEMPLATE
		$this.html(newHtml) if newHtml isnt html   # avoid touching the DOM when there's nothing to replace
