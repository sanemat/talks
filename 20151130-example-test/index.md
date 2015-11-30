---
pagetitle: Example Test for Ruby Module
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20151130-example-test/
lang: ja
description: Example Test for Ruby Module / Lightning Talks
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>


# Example Test for Ruby Module

sanemat {AT} tachikoma.io


## That moment when you have executed `bundle exec rake release`

`bundle exec rake release` あるある

* Forget to require a split file after refactoring
    * リファクタリングしてファイル分割したらrequire 忘れる
* Forget to add a necessary file
    * 必要なファイルがない
* Add an unnecessary file
    * 不要なファイルがある

## Example test

* [GoのExampleテストが便利 : swdyh](http://swdyh.tumblr.com/post/55771477125/go%E3%81%AEexample%E3%83%86%E3%82%B9%E3%83%88%E3%81%8C%E4%BE%BF%E5%88%A9)
* [npmパッケージをExampleテストしよう | Web Scratch](http://efcl.info/2015/07/29/example-test-on-npm/)

Add actual example into `./example` directory as "you usually use".

実際に動くexampleを`./example`ディレクトリ以下に「普通に使うように」作る。


### Example test example

Isolate an example into `./example`.

Exampleは`./example` 以下に閉じ込める。

Use this quite regularly.

普通に使う。

[packsaddle/ruby-env_pull_request](https://github.com/packsaddle/ruby-env_pull_request)

```
example/
├── Gemfile
├── Gemfile.lock
├── example.rb
└── vendor
    └── bundle
```

```
# example/Gemfile
source 'https://rubygems.org'
gem 'env_pull_request', path: '../'
```

```
# .gitignore
/example/.bundle/
/example/vendor/bundle/
```

```
$ cd example && bundle install --path vendor/bundle
```

```
# example/example.rb
require 'env_pull_request'

env = EnvPullRequest.new
puts env.pull_request_id
```

```
$ cd example && bundle exec ruby example.rb && cd ..

$ cd example && TRAVIS_PULL_REQUEST=123 bundle exec ruby example.rb && cd ..
123
```

```
# .travis.yml
script:
- bundle exec rake && cd example && bundle exec ruby example.rb && cd ..
```


## Good point

なにがよいのか

* You can confirm there are necessary files exactly on `./example/vendor/bundle`
    * `./example/vendor/bundle` 以下に必要なファイルが必要なだけ来ているか確認できる


### Differences

他の方法との違い

#### Difference from print debug, `binding.pry` and `byebug`

print debug, binding.pry/byebug と何が違うのか

* Keep an actual example on `./example`
    * 実際に動くexampleが`./example`以下に出来る・残る
* Become into test template
    * testのひな形に出来る
* Un-executable code in `README.md` is awful
    * `README.md` に実行できないコードをそれっぽく書くよりよっぽどマシ


#### Write a test is better

テスト書いたほうがいいじゃん

* Sure!
    * ごもっとも!


## Where to use

使いどころ

* Use while thinking module interface
    * まずインターフェースの考え始めに使う
    * [Unix Philosophy と Node.jsのモジュールの作り方 - from scratch](http://yosuke-furukawa.hatenablog.com/entry/2014/04/22/121014)
    * [how I write modules - substack](https://gist.github.com/substack/5075355)
* Find careless mistake
    * ケアレスミスの発見用
* Substitute writing test with this
    * テスト書くのが難しい場合に代用する


## Summary

まとめ

Example test as "you usually use" is valuable in some case.

「普通に使うように」exampleを書くというのが便利なときがある


<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151130-example-test%2F&t=Example%20Test%20for%20Ruby%20Module%20%2F%20Lightning%20Talks" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>
