rubyann
-------

**rubyann** is a jQuery plugin that allows you to write ruby annotations using a custom-markup syntax. [Ruby Characters](http://en.wikipedia.org/wiki/Ruby_character) look something like this:

![ruby example](http://www.useragentman.com/blog/wp-content/uploads/2010/10/example-IE-with.png)

Creating ruby characters requires a cumbersome (and ugly) xhtml syntax, so __rubyann__ is an alternative to writing/embedding xml manually.

#### Example:

The classic use-case for ruby annotations is Japanese [furigana](http://en.wikipedia.org/wiki/Furigana). To use __rubyann__ we wrap characters in a simple markup using braces and commas like this: {kanji,hiragana}:

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

Which renders to the page with furigana (also see __demo.html__ in the source for working example)

![ruby example](http://www.users.on.net/~spurry/images/ruby-example.png)

(image supplied as GitHub markdown doesn't seem to allow ruby annotations)

###Notes:
__rubyann__ uses the 'fallback' syntax (xhtml 'rp' element) which puts the ruby text in brackets if the browser doesn't support ruby characters.
Ruby Annotation is supported my most modern browsers - IE5+ / Chrome / Firefox + [HTML Ruby Addon](https://addons.mozilla.org/en-US/firefox/addon/6812/)
Firefox also supports ruby annotations via CSS3 - see [HTML5 Ruby Annotations using CSS3](http://www.useragentman.com/blog/2010/10/29/cross-browser-html5-ruby-annotations-using-css/)

__rubyann__ is written in [coffeescript](http://jashkenas.github.com/coffee-script/); it has a qunit test suite also in coffeescript. A minified javascript file is supplied as a download for tagged versions.