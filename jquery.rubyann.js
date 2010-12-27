(function() {
  var $;
  $ = jQuery;
  $.fn.extend({
    rubyann: function() {
      var annotationRegex, baseXml;
      baseXml = '<ruby><rb>{rbase}</rb><rp>(</rp><rt>{rtext}</rt><rp>)</rp></ruby>';
      annotationRegex = /\{.*\}/g;
      return this.each(function() {
        var storyText, userAnnotations;
        storyText = $(this).text();
        userAnnotations = annotationRegex.exec(storyText);
        if (userAnnotations === null) {
          return $(this);
        }
        $.each(userAnnotations, function(index, value) {
          var rbase, rtext, rxml, split;
          split = value.split(',');
          if (split.length !== 2) {
            return $(this);
          }
          rbase = split[0].replace('{', '');
          rtext = split[1].replace('}', '');
          rxml = baseXml.replace('{rbase}', rbase).replace('{rtext}', rtext);
          return (storyText = storyText.replace(value, rxml));
        });
        return $(this).html(storyText);
      });
    }
  });
})();
