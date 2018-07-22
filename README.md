jquery.rubyann
-------
(jquery.rubyann is a rename of the original 'rubyann' - this was to be able to distinguish between jquery and non-jquery versions, which are planned)

**jquery.rubyann** is a jQuery plugin that allows you to write [ruby annotations](https://en.wikipedia.org/wiki/Ruby_character) using a simplified (custom) markup syntax.

[Ruby Characters](http://en.wikipedia.org/wiki/Ruby_character) (annotations) are small reading aids that are placed on top of characters (eg [furigana](http://en.wikipedia.org/wiki/Furigana) with kanji in Japanese).

[![NPM](https://nodei.co/npm/jquery.rubyann.png)](https://nodei.co/npm/jquery.rubyann/)

#### Example

Below, is the required HTML to render a simple sentence using ruby annotations.

(The goal of this HTML is to simply output the sentence "The word for Japanese language is 日本語" - adding hiragana characters above the kanji)

`The word for 'japanese language' is <ruby><rb>日</rb><rp>(</rp><rt>に</rt><rp>)</rp></ruby><ruby><rb>本</rb><rp>(</rp><rt>ほん</rt><rp>)</rp></ruby><ruby><rb>語</rb><rp>(</rp><rt>ご</rt><rp>)</rp></ruby>`

It renders Like this:
#####  The word for 'japanese language' is <ruby>  <rb>日</rb>	<rp>(</rp>	<rt>に</rt>	<rp>)</rp></ruby><ruby>  <rb>本</rb>	<rp>(</rp>	<rt>ほん</rt>	<rp>)</rp></ruby><ruby>  <rb>語</rb>	<rp>(</rp>	<rt>ご</rt>	<rp>)</rp></ruby>

#
To do this using __jquery.rubyann__ we wrap characters in a much simpler markup - using braces and commas - where the main character is first, and the annotated character (above it) is separated by a comma, both inside braces:

    <div class="furiganaText">
      The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
    </div>

Without being rendered by __jquery.rubyann__, the custom syntax will render like this:

<div style="background-color:#dddddd;padding:5px;margin-left:10px">
The word for 'japanese language' is {日,に}{本,ほん}{語,ご}
</div>

When __jquery.rubyann__ is called in jquery/javascript as below:

    $('.furiganaText').rubyann();

The same HTML shown above (eg `<ruby>...`) will be rendered instead.

So we've basically replaced a bunch of complex HTML markup with our own simple markup, which is then converted by running `rubyann` over the element.

<br/>

See __demo/demo.html__ in the source tree for a working example/demonstration.


## Notes

All modern browsers support Ruby Annotations - see [Ruby Annotation Browser Support](http://caniuse.com/#feat=ruby)

__jquery.rubyann__ uses the 'fallback' syntax (xhtml 'rp' element) which puts the ruby text in brackets if the browser doesn't support ruby characters.

__jquery.rubyann__ is written in [coffeescript](http://jashkenas.github.com/coffee-script/) and includes a [qunit](https://qunitjs.com/) test suite - also written in coffeescript.

#### Usage
__braces__ used in the custom syntax can be replaced by delimeters of your choice. 2 characters must be specified (left/right) in a string

    $('.furiganaText').rubyann({delimiters:"[]"});
    $('.furiganaText').rubyann({delimiters:"@@"});

#### Contributions
This is a very small piece of code and I would be very happy to take any suggestions to improve it in any way.

Feel free to create an issue or drop me an email.

## Build
#### Requirements

[NodeJS](http://www.nodejs.org)

#### Run
`npm install` or `yarn` - installs the (NPM) dependencies ([yarn](https://yarnpkg.com/) is highly recommended)

`npm run release` transpiles all source and minifies the main plugin source to 'dist' directory

`npm run test` transpiles and runs the test suite

