rubyann
-------

**rubyann** is a jQuery plugin that allows you to write [ruby annotations](https://en.wikipedia.org/wiki/Ruby_character) using a much simplified (custom) markup syntax.

[Ruby Characters](http://en.wikipedia.org/wiki/Ruby_character) are small reading aids that are placed on top of characters.


#### Example

The classic use-case for ruby annotations is Japanese [furigana](http://en.wikipedia.org/wiki/Furigana).

Below, we see the required XML syntax to render a simple sentence using ruby annotations.

The goal of this is to simply output the sentence "The word for Japanese language is 日本語" - adding hiragana characters above the kanji.

`The word for 'japanese language' is <ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>`

To do this using __rubyann__ we wrap characters in a much simpler markup - using braces and commas - like this:

    <div class="furiganaText">
      The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
    </div>

Without being rendered by __rubyann__, the custom syntax will render to HTML like this:

<div style="background-color:#dddddd;padding:5px;margin-left:10px">
The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
</div>

When __rubyann__ is called in jquery/javascript as below, the same XML syntax shown above will be rendered instead.

    $('.furiganaText').rubyann();

So, the HTML is modified to use ruby annotation xml (the part you probably don't want to type in manually):


See __demo.html__ in the source for working example/demonstration.


###  The word for 'japanese language' is <ruby>  <rb>日</rb>	<rp>(</rp>	<rt>に</rt>	<rp>)</rp></ruby><ruby>  <rb>本</rb>	<rp>(</rp>	<rt>ほん</rt>	<rp>)</rp></ruby><ruby>  <rb>語</rb>	<rp>(</rp>	<rt>ご</rt>	<rp>)</rp></ruby>

#
#### Notes

Ruby Annotation is supported by most modern browsers - see [Ruby Annotation Browser Support](http://caniuse.com/#feat=ruby)

__rubyann__ uses the 'fallback' syntax (xhtml 'rp' element) which puts the ruby text in brackets if the browser doesn't support ruby characters.


__rubyann__ is written in [coffeescript](http://jashkenas.github.com/coffee-script/); it has a qunit test suite also in coffeescript.

__braces__ used in the custom syntax can be replaced by delimeters of your choice. 2 characters must be specified (left/right) in a string

    $('.furiganaText').rubyann({delimiters:"[]"});
    $('.furiganaText').rubyann({delimiters:"@@"});

#
#### Build setup

Install [NodeJS](www.nodejs.org)

Install gulp (globally in order to run from command (eg `npm install -g gulp-cli`) - see http://gulpjs.com/

Install the (NPM) dependencies by running `npm install` or `yarn` (if you have [yarn](https://yarnpkg.com/) installed)

Run the build (creates a minified release file and runs tests) by running `gulp` from the root rubyann directory
