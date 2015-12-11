---
pagetitle: Tachikoma next
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20151210-tachikoma-next/
lang: ja
description: Tachikoma next
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>


# Tachikoma next

sanemat {AT} tachikoma.io


## Bundle update regularly, frequently

### 2013-05-31 - Kensuke Nagae @kyanny

[Continuous gem dependency updating with Jenkins and Pull Request](https://speakerdeck.com/kyanny/continuous-gem-dependency-updating-with-jenkins-and-pull-request)

### 2013-06-23 - Kenichi Murahashi @sanemat

[Tachikoma gem first version v2.0.0 (not published)](https://rubygems.org/gems/tachikoma) [commit](https://github.com/sanemat/tachikoma/commit/a813fc718d43139820d36a20dfd8595958f6b4e8)

### 2014-09-17 - Kenichi Murahashi @sanemat

[When was the build passing? / Travis CI Meetup 2014-09-17](http://sanemat.github.io/talks/20140917-travis-ci-meetup-tachikoma-io/)

## Motivation

* shell scriptで書くのがそもそもツライ
* ほぼ同じスクリプトがプロジェクトごとに散らばるのでツライ

## Tachikoma gem

### pros

* yamlの設定を置くと、gemとコマンドラインで完結する

### cons

* カスタマイズ性低い
* 実行環境は自分で作成する必要がある
* 設計思想として、自前jenkinsで動かすのを第一に考えていた
    * CI as a web serviceの発展


## tachikoma.io

### pros

* github oAuthで連携, toggle一発
* .tachikoma.ymlで設定

### cons

* リポジトリの読み書き権限もらうのが非常に苦戦
* public版も、ユーザー権限でpush出来るようにするものはあるが、300+のユーザー中利用者1(自分のみ)
* ユーザー権限でpushできると、botのcommitの上に自分のコミット詰めるので、すごい便利なのだが…
* カスタマイズ性低い


## 揺り戻し

* shell scriptやruby scriptで書けばいいじゃん

しかし

やっぱりつらい

shell script or Ruby scriptで書くの何がツライのか
直にOctokit使えばいいだけなのわかるけど、いちいちAPI調べてとかダルい


## 対象を絞ってより使いやすくするアプローチ

### Ruby gemの場合

* https://www.deppbot.com/
* circleci-bundle-update-pr
* ci-bundle-update

### Node.js npmの場合
* http://greenkeeper.io/


## ここから知見 + 私見 + 主張

カスタマイズ欲求がプロジェクト・プロダクトの特性によって無限に出てくる(はず)

* mongodb使いたい
* mecab使いたい
* 頻度は平日の朝に来て欲しい
* プロジェクト構成が、トップレベルにRubyやRails来てない
* 複数Rubyプロジェクトが入っている
* Node.js npmもやりたい


これは、travis-ci, CircleCIを再発明することになるのでは??

CI nativeのアプリケーションへ

CI上で動けばいいじゃん


### 先回り では、bundle update as a serviceは不要?

では、tachikoma.ioやdeppbotは不要なのか? tachikoma.io止めちゃうの?

やっぱり、スクリプト書くのめんどい…
設定メンドイな…わかってる自分でやるのもメンドイぐらいなので、他の人はたぶんできないな
やっぱtachikoma.io便利だな

自分には必要!

### 結論




compare-linker

webサービスなら同時にやってくれる方がいいかもだけど、
ライブラリならtachikomaに内蔵するより、別コマンドの方が良い
あと、github api依存の部分を外した

アプリの依存に載せたくないが、.lockは取りたい、場合なども
bundle install --gemfile=Gemfile.bundle-update

にしておけばいいんじゃないですかね(試してない)
なお、そうするとこっちの依存部分についても、定期的にbundle updateできる。
(ように自分で書けば良い)

compare-linker-wrapperで出力して、saddlerでpull requestのコメントに載せる

課題
[定期的にライブラリの依存関係をアップデートしてPull Requestする – Saddler - checkstyle to anywhere](http://packsaddle.org/articles/interval-pull-request-update-overview/)

gem installがコケて定期実行に失敗することがあるらしい
travis_retry gem install xxx とすればよいのでは(travisなら)

tachikoma gemは発展的解消できたな
でも、コレ設定メンドイな…わかってる自分でやるのもメンドイぐらいなので、他の人
はできないな
やっぱtachikoma.io便利だな

shell scriptなら言語中立にいけるやん! パイプ最高や!期にノッて書いたライブラリ
群

あれ、shell scriptって環境依存激しいし微妙に方言が有る
windows? なにそれうまいの?
ユーザー多いし、どうせなら多くの人に使ってもらわないと。

このツールチェーンでは、C extensionを使わない。nokogiri, ruggedを避ける
標準モジュールを使う
nokogiriではなくrexml
ビルドするの大変になるからrugged使わなかったけど、それではwindowsで動かなそ
う、などなど

golangで書き換えたいからgolangの勉強はじめようかな うーん n度目のgolangやりた
い期
golangだとインストールがcurlとかになるのでそれはそれでどうなのよ




<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151210-tachikoma-next%2F&t=Saddler%20-%20better%20pronto%20%2F%20Shibuya.rb" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20151210-tachikoma-next
