---
pagetitle: How to be friends with bundler
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20160907-how-to-be-friends-with-bundler/
lang: ja
description: How to be friends with bundler
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>


# How to be friends with bundler

sanemat {AT} tachikoma.io

## What is "be friends with bundler"???

Slide: EN
Talk: JA

Money Forward, Inc.

## Challenge 1: ruby DSL

```
ruby "2.3.0"
source "https://rubygems.org"
gem "ecdsa"
```

In Gemfile.

- Error out if the ruby version doesn't match

```
$ bundle
Your Ruby version is 2.3.1, but your Gemfile specified 2.3.0
(exit code: 0)
```

You may use this with heroku app.

### History

Bundler v1.2.0 (Aug 30, 2012)

- add ruby to DSL, to specify version of ruby

### `bundle update`

Tachikoma is a gem which helps `bundle update` and sends pull request.
[Tachikoma.io](http://tachikoma.io) is `Bundle Update as a Service`.
I'm a founder of both tachikoma gem and tachikoma.io :)

I use "one" ruby version, and run `bundle update` with Gemfile which has `ruby "2.3.0"`, `ruby "2.3.1"`, ...


### How to be friends with bundler

Run this before `bundle update`.
```
sh(*['ruby', '-i', '-pe', '$_.gsub! /^ruby/, "#ruby"', 'Gemfile'])
```

:-)

https://github.com/sanemat/tachikoma/blob/391307db508f29cde46957edf9baba38c7a2933e/lib/tachikoma/application.rb#L81


## Challenge 2: BUNDLED WITH

```
GEM
  remote: https://rubygems.org/
  specs:
    ecdsa (1.2.0)

PLATFORMS
  ruby

DEPENDENCIES
  ecdsa

BUNDLED WITH
   1.12.0
```

You can store bundler version in Gemfile.lock after `bundle update`.

### History

Bundler v1.10.0 (2015-05-28)

Bundler v1.9 always removes BUNDLED WITH section.
Bundler v1.10 always adds BUNDLED WITH section.

I use one bundler :(

### How to be friends with bundler

https://github.com/packsaddle/ruby-restore_bundled_with

$ restore-bundled-with

This restores BUNDLED WITH section from git repository.

## Challenge 3: RUBY VERSION

```
GEM
  remote: https://rubygems.org/
  specs:
    ecdsa (1.2.0)

PLATFORMS
  ruby

DEPENDENCIES
  ecdsa

RUBY VERSION
   ruby 2.3.1p112

BUNDLED WITH
   1.12.5
```

If you write `ruby "2.3.1"`, then lock ruby version in Gemfile.lock.
This allows you can write `ruby "~> 2.3.0"`.
Cool!

### History

Bundler v1.12.0 (2016-04-28)


`bundle update` with v1.12.0, always add RUBY VERSION section.
`bundle update` with v1.12.5, if creating Gemfile.lock, then adding RUBY VERSION, if not then don't write RUBY VERSION in Gemfile.lock.

I use one ruby :)

### How to be friends with bundler

https://github.com/packsaddle/ruby-restore_ruby_version

$ restore-ruby-version

This restores RUBY VERSION section from git repository.

This does not publish yet ;(

## Bundler v1.13

Coming soon

## Bundler v2.0

Future :)

- gems.rb
- gems.locked

To be continued...


<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20160907-how-to-be-friends-with-bundler%2F&t=How%20to%20be%20friends%20with%20bundler" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>
