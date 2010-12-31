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
    rubyann: function(options) {
      var defaults, delimitEnd, delimitStart;
      defaults = {
        delimiters: '{}'
      };
      options = $.extend(defaults, options);
      if (options.delimiters.length !== 2) {
        return;
      }
      delimitStart = "\\" + options.delimiters[0];
      delimitEnd = "\\" + options.delimiters[1];
      return this.each(function() {
        var matches, storyText;
        storyText = $(this).text();
        matches = storyText.match(RegExp("" + delimitStart + ".*?,.*?" + delimitEnd, "g"));
        if (matches === null) {
          return this;
        }
        $.each(matches, function(index, value) {
          var rbase, rtext, rxml, split;
          split = value.split(',');
          if (split.length !== 2) {
            return;
          }
          rbase = split[0].replace(options.delimiters[0], '');
          rtext = split[1].replace(options.delimiters[1], '');
          if (rbase.length === 0 || rtext.length === 0) {
            return;
          }
          rxml = baseXml.replace('{rbase}', rbase).replace('{rtext}', rtext);
          return storyText = storyText.replace(value, rxml);
        });
        return $(this).html(storyText);
      });
    }
  });
}).call(this);
