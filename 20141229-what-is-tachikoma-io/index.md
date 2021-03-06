---
pagetitle: What is Tachikoma.io
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20141229-what-is-tachikoma-io/
lang: ja
description: What is Tachikoma.io? / Fukuoka Ruby Award 2015
ogimage: http://sanemat.github.io/talks/20141229-what-is-tachikoma-io/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# What is Tachikoma.io

## 端的になに?

「Tachikoma.io」

* Ruby/Railsアプリケーションを
* 健全に保つ
* 一番痛みが少ない
* Bundle Update as a Service

## メリット

* Ruby/Railsの利用者が、依存ライブラリのバージョンアップにより簡単に取り組めるようになる
* その結果、プロダクトの寿命が伸びる
* さらに、利用者が、本当にやりたかったコアに多くの時間を割けるようになる

## Rubyを適用した箇所

* ウェブアプリケーション部分
    * Ruby on Rails on Heroku
* バックエンドのビジネスロジック部分
    * Ruby and Tachikoma gem on Digital Ocean
    * [Tachikoma gem](https://github.com/sanemat/tachikoma) 部分がOSS

Ruby適用箇所で特に新規性なし
一般的なwebアプリケーション

RubyとRailsが開発チームの一番手に馴染んだサービスである

また、自らドッグフーディングしている,
Tachikoma.io自身がTachikoma.ioユーザーである

## Rubyを活用したことによる効果、社会に及ぼす影響

* Ruby/Railsの活用事例は増えている
* その一方で、バージョンアップに掛けるコストの話、バージョンアップしないことによる古いRuby/Railsを使っていることの痛み、について聴く頻度も増えている
    * [Rails 4 へのアップグレード時に遭遇した問題 – クックパッド開発者ブログ](http://techlife.cookpad.com/entry/2014/09/30/172628)
    * hsbt, GMOペパボ [From ‘Legacy’ to ‘Edge’ 2014 edition // Speaker Deck](https://speakerdeck.com/hsbt/from-legacy-to-edge-2014-edition)
    * tmm1, GitHub [RubyKaigi 2014 | Ruby 2.1 in Production](http://rubykaigi.org/2014/presentation/S-AmanGupta)
    * [3-2-stable: ruby 2.2 compatibility by tmm1](https://github.com/rails/rails/pull/18306)
* Tachikoma.ioの利用などにより、継続的にメンテナブルなRubyアプリケーションの増加によって、健全にRubyアプリケーションを活用する人数、プロジェクトが増える
* より見たことないものが出てくる

[Tachikoma.io][tachikoma-io]

sanemat {AT} tachikoma.io

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20141229-what-is-tachikoma-io%2F&t=What%20is%20Tachikoma.io%3F%20%2F%20Fukuoka%20Ruby%20Award%202015" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20141229-what-is-tachikoma-io
