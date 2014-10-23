---
pagetitle: Dependency Update Bot
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20141023-dependency-update-bot/
lang: ja
description: Dependency Update Bot / Presentation
ogimage: http://sanemat.github.io/talks/20141023-dependency-update-bot/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Dependency Update Bot

amatsuda, hsbt がRubyやRailsのバージョンアップやってると聞く。
それだけやっているわけじゃないんだろうけど、そんな職人芸を要求しないといけないことなのか?
せめてその7割ぐらいを自動化(あるいは汎用化)出来ないか。
そうしたら、amatsuda, hsbtを雇えないスタートアップには百人力なのでは。
それならお金を払いたい(のではないか?)

7割の amatsuda bot, hsbt botを作りたい。
みんな、もっと本当にやるべきことがあるはずだ。
本人はそれはそれで楽しんでいるのかもしれないから(特に面識はないから知らない そのうち聞いてみたい)いいんだけど、なんだかなーってなってしまう。
RubyやRailsの特にコーナーケースを直すのは自分には荷が重いから、そこでテコが効いてるのならいいんだけど。

Bundle updateは楽しい。
最新の変更についていくのが容易になる。
簡単にコーナーケースでバグが踏める。
勉強になる。
でも、みんなが同じようにgithub探しに行って、diff見て…というのをやるべきだとは思わない。
作りたいものを作って欲しー
Bundle update楽しい人が、楽しめる場を作ったら、もっとほかのみんなが楽しく出来るんじゃなかろうか。

PythonやPerlの人たちのところに聞きに行ったら、それほど下位互換バッキバキじゃない。
dependency hellになってないので、そこまで切実じゃない。
dependency hellにならないように依存ライブラリを厳選する、たとえばdjangoを使わない、など聞いた。

## The progress

9/17のtravis ci meetupのLTで公にお披露目。
9/18-9/20のはてなブックマーク効果、130 accounts。
hacker newsで+10, プラスアルファで現在2014-10-23 19:23 148。
1コでもリポジトリをactiveにしてくれた人 61。
ぼくの意図通りに使えてるようにみえる人 20。
private reposの有料アカウント 0。
2014-09-14 ~ 2014-10-22 で2483ユーザーなので、ランディングページもうちょっとわかりやすくしたらでだいぶ取りこぼしたかな。
pull requestから人が集まる妄想してたけど、今のところそんなことは起きてない。
1件だけ。しかも未対応のpython… [Exec tachikoma update 20140918181203 by tachikomapocket Pull Request #172 kawazrepos/Kawaz3rd](https://github.com/kawazrepos/Kawaz3rd/pull/172)
甘くないなー
影響力のある人/プロダクトに使ってもらう(?) ちょっと博打的発想。
課金->使用ではなく、1mo無料->課金 にした方がいいかも。(小手先)
別のマネタイズ? テストやライブラリの統計・解析・分析など
private reposの有料アカウントがそれなりに集まっても、人一人雇うのも厳しい。ゴールは?
GitHub, Atlassian, Travis CI, Circle CI, ThoughtBot, あたりの1戦略に収まる程度? うーん

### 仮説

`bundle update`で日々バージョンを上げていくことが大事だとわかっている企業/個人は、もう内部でその仕組を持っている(?)
必要だと思った人は内製してそう。e.g. Quipper などもとのtachikoma gem ユーザー。
Rails界隈以外はそんなにアップデートで死んでない。
この仕組に載せるまで、まず最新に追いつくところ、が職人芸なので、そこを何とかしたら良い?? しなければいけない?
定期的にクリーンな環境から何かを提供するaggregatorになる? travis-ci, circle ciのアドオン提供など?


## 現productの精度を高める

- 現状で、ビルドできないなどあるので、その対応
- コアに使ってくれているユーザーにヒアリングに行く
- コアに使ってくれそうな法人、スタートアップに営業に行く

## さらに補助productを作る

- Better rubygems.org
     - http://handcooler.org を作ったけど、もっとBetter, metacpan.org級のもの
- Tachikoma.io + 助言(synvert?)
- gemfile-arranger(構想)
- 匿名化して統計、解析など
- Rubyに特化していく
- Javascriptに特化していく
- CIに手を広げる(?)
- なんかhookのhubになる(適当)
   - レシピを書いたら、何かの契機で何かをするプラットフォーム

### 着地点?

3年でGitHubに売却してGitHubberになる。
IPOするイメージは沸かないので。M&Aに持って行きたい。
だとすると、チームか、ソリューションか、ユーザー数か、、、

## Service

Tachikoma.ioがしてくれること。
リポジトリのmaster branchに対して、何もせずに、定期的に、Pull Requestを送る。
すると、Travis CIのpass/failで差分に気付く。

## One more thing...

おまけ
何もせずに、定期的に、Pull Requestを送る、と言いました。
各言語編
ruby: bundler, perl: carton, node.js: npm と言語ごとにパッケージマネージャーがある。
Gemfile, Gemfile.lock, cpanfile, cpanfile.snapshot, package.json, etc. と依存関係コントロールするためのメタファイル群がある。
これらは依存関係update hellだ。
これはもうこまめに定期的に最新安定版にアップデートしていく以外生き延びるすべはないのは確定的に明らか。
定期的に `bundle update` (ruby) / `carton update` (perl) / `david update` (node.js)
やってますか? やってないでしょ? やってる? もっと簡単になるよ。
それ[Tachikoma.io][tachikoma-io]で出来るよ。`.tachikoma.yml`を置くだけでok。

```yaml
.tachikoma.yml
strategy: bundler
strategy: carton
strategy: david
strategy: none (default)
```

定期的に `bundle update`してTachikoma.ioからpull requestが来る。
この場合、Travis CI のbuildログだけでなく、GitHubのcompare viewも頼りになる。
Tachikoma.ioのできることはTachikoma.ioに任せる。
あなたはあなたのやりたいことをやろう。

## Summary

public repos版はFree!
private repos版は月額有料です

- [for private individual $9/mo ~~$19~~](https://gumroad.com/l/JwtkV/travisci)
- [for private organization $49/mo](https://gumroad.com/l/oDPx)
- for enterprise
    - email: sanemat {AT} tachikoma.io

## This is service statement below

この下のはサービスステートメントです:

ライブラリの依存バージョンを上げないことは、すぐにはライブラリやアプリケーションにダメージを与えません。
新しく使いたいライブラリを追加するときに、既存のライブラリにセキュリティフィックスが出たときに、それぞれが正しく動作するバージョンの組み合わせを見つけることは、非常に困難です。
仮に組み合わせを見つけたとしても、すごく後ろ向きですし、次を追加するとき、より困難になって立ちはだかります。
また、ライブラリの新機能、スピードアップ、Ruby/Node.js/etc.のバージョンアップなどメリットを享受するために低いバージョンだとそれが使えないことがあります。
結果的に一番痛みが少ないのは、常に定期的に(安定した)最新版を組み合わせていくことです。
ここまでみんな知ってるしわかってるのに、なぜ出来ない?

それはツールやインテグレーションがまだ不足しているからだ、と私は考えます。
それを埋める1つのパーツがTachikoma.ioです。

[Tachikoma.io][tachikoma-io]

sanemat {AT} tachikoma.io

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20141023-dependency-update-bot%2F&t=Dependency%20Update%20Bot" frameborder=0 frametransparency=1 scrolling=no height=30 width=400>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20141023-dependency-update-bot
