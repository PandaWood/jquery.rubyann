(function(){var r;r="<ruby> <rb>$2</rb> <rp>(</rp> <rt>$3</rt> <rp>)</rp> </ruby>",$.fn.extend({rubyann:function(e){var t,i,n,l;if(n={delimiters:"{}"},e=$.extend(n,e),2===e.delimiters.length)return l="\\"+e.delimiters[0],t="\\"+e.delimiters[1],i=RegExp(l+"((\\S+?),(\\S+?))"+t,"g"),this.each(function(){var e,t,n;if(e=$(this),t=e.html(),(n=t.replace(i,r))!==t)return e.html(n)})}})}).call(this);