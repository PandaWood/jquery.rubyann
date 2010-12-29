(function() {
  var $, baseXml;
  $ = jQuery;
  baseXml = '<ruby>\
	<rb>{rbase}</rb>\
	<rp>(</rp>\
	<rt>{rtext}</rt>\
	<rp>)</rp>\
</ruby>';
  $.fn.extend({
    rubyann: function() {
      return this.each(function() {
        var matches, storyText;
        storyText = $(this).text();
        matches = storyText.match(/\{.*?,.*?\}/g);
        if (matches === null) {
          return $(this);
        }
        $.each(matches, function(index, value) {
          var rbase, rtext, rxml, split;
          split = value.split(',');
          if (split.length !== 2) {
            return this;
          }
          rbase = split[0].replace('{', '');
          rtext = split[1].replace('}', '');
          if (rbase.length === 0 || rtext.length === 0) {
            return this;
          }
          rxml = baseXml.replace('{rbase}', rbase).replace('{rtext}', rtext);
          return storyText = storyText.replace(value, rxml);
        });
        return $(this).html(storyText);
      });
    }
  });
}).call(this);
