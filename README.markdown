rubyann
-------

**rubyann** is a jQuery plugin that allows you to write [ruby annotations](https://en.wikipedia.org/wiki/Ruby_character) using a much simplified (custom) markup syntax.

[Ruby Characters](http://en.wikipedia.org/wiki/Ruby_character) or "annotations" are small reading aids that are placed on top of characters (eg [furigana](http://en.wikipedia.org/wiki/Furigana) with kanji in Japanese).


#### Example

Below, we see the required XML syntax to render a simple sentence using ruby annotations.

(The goal of this HTML is to simply output the sentence "The word for Japanese language is 日本語" - adding hiragana characters above the kanji)

`The word for 'japanese language' is <ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>`

Which outputs to HTML Like this:
#####  The word for 'japanese language' is <ruby>  <rb>日</rb>	<rp>(</rp>	<rt>に</rt>	<rp>)</rp></ruby><ruby>  <rb>本</rb>	<rp>(</rp>	<rt>ほん</rt>	<rp>)</rp></ruby><ruby>  <rb>語</rb>	<rp>(</rp>	<rt>ご</rt>	<rp>)</rp></ruby>

#
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


See __demo.html__ in the source tree for a working example/demonstration.


## Notes

[Ruby Annotation Browser Support](http://caniuse.com/#feat=ruby)

__rubyann__ uses the 'fallback' syntax (xhtml 'rp' element) which puts the ruby text in brackets if the browser doesn't support ruby characters.

__rubyann__ is written in [coffeescript](http://jashkenas.github.com/coffee-script/).
The project includes a [qunit](https://qunitjs.com/) test suite - also written in coffeescript.

#### Usage
__braces__ used in the custom syntax can be replaced by delimeters of your choice. 2 characters must be specified (left/right) in a string

    $('.furiganaText').rubyann({delimiters:"[]"});
    $('.furiganaText').rubyann({delimiters:"@@"});


## Build
#### Requirements

[NodeJS](http://www.nodejs.org)

[gulp](http://gulpjs.com/) - installed globally - to run from command eg `npm install -g gulp-cli`

#### Run
Install the (NPM) dependencies by running `npm install` or `yarn` ([yarn](https://yarnpkg.com/) is highly recommended)

Simply type `gulp` in the root rubyann directory. The default build task transpiles and minifies the main plugin source and also runs the qunit test suite
