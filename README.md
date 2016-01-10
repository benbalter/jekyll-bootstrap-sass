# Jekyll Bootstrap Sass

*A plugin to add the [Twitter Bootstrap](https://github.com/twbs/bootstrap) framework to your Jekyll site.*

## Installation

Add the following to your site's `Gemfile`:

```ruby
gem 'jekyll-bootstrap-sass'
```

And add the following to your site's `_config.yml` file:

```yaml
gems:
  - jekyll-bootstrap-sass
```

## Usage

Create a `.scss` file (e.g., `assets/style.scss`), with the following:

```scss
---
---

@import 'bootstrap';

// (Your custom CSS Here)
end
```

When your site is built, Jekyll will automatically add the Bootstrap framework before it renders your site's css. In the above example, the resulting file would be `assets/style.css` with Bootstrap's CSS followed by your own.

## Assets

By default, Jekyll Bootstrap SaSS will simply make the `@import 'bootstrap';` directive available to your custom stylesheets so that you can more easily include Bootstrap's CSS.

If you would like to use Bootstrap's static assets (e.g., fonts, javascripts), you'll need to add the following to your site's `_config.yml`:

```yml
bootstrap:
  assets: true
```

This will create `/assets/fonts/bootstrap` and `assets/javascripts/bootstrap` folders in the generated site, which you can include in your site's header as you would any other javascript file or font.

If font's aren't loading properly, you may need to add the following before the `import` directive:

```scss
$icon-font-path: "{{ site.github.url }}/assets/fonts/bootstrap";
```

## Specifying the Bootstrap version

Jekyll-bootstrap-sass relies on official [`bootstrap-sass` Ruby gem](https://github.com/twbs/bootstrap-sass). To specify the version of Bootstrap used, simply specify the `bootstrap-sass` gem version in your Gemfile.
