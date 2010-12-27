rubyann
-------

**rubyann** is a jQuery plugin to write ruby annotations into existing HTML using [ruby characters.](http://en.wikipedia.org/wiki/Ruby_character)

This is an alternative to writing ruby markup manually, which can be quite cumbersome - especially if your HTML is not generated.

#### Example:

The classic use-case for ruby annotations is Japanese [furigana](http://en.wikipedia.org/wiki/Furigana) - the small hiragana characters above the kanji - to help readers who don't know the character.

To use __rubyann__ we wrap characters in a simple markup using braces and commas like this: {kanji,hiragana}:

    <div class="furiganaText">
      The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
    </div>

Before __rubyann__ transforms it, it renders like this:
<div style="background-color:#dddddd;padding:5px;margin-left:10px">
The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
</div>

When __rubyann__ is called in jquery/javascript like this:

    $('.furiganaText').rubyann();

The HTML is modified to use ruby annotation xml (this is the part you probably don't want to type yourself):

    The word for 'japanese language' is <ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>

Which renders to the page with furigana (won't render with GitHub markdown unfortunately, please see __demo.html__ in the source for working example)
<div style="background-color:#dddddd;padding:5px;margin-left:10px">
The word for 'japanese language' is <ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>
</div>

This assumes you have ruby annotation support in your browser - IE5+ / Chrome / Firefox + [HTML Ruby Addon](https://addons.mozilla.org/en-US/firefox/addon/6812/) 

Firefox also supports ruby annotations via css3 - see [HTML5 Ruby Annotations using CSS3](http://www.useragentman.com/blog/2010/10/29/cross-browser-html5-ruby-annotations-using-css/)