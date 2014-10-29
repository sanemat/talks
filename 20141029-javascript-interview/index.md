---
pagetitle: JavaScript Interview
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20141029-javascript-interview/
lang: ja
description: JavaScript Interview / Presentation
ogimage: http://sanemat.github.io/talks/20141029-javascript-interview/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# JavaScript Interview

## Customer Segment

顧客セグメントのテスト
javascript, nodejs, フロントエンド, バックエンド 習熟度
継続的にサービスを開発してる リリース後も担当するか(?)
納品して終わり 複数

## Dependency Control Tool

依存管理ツール 使ったことある よく使う 知ってる
component, npm, bower, bundler(Ruby), composer(PHP), carton(Perl),
pip(Python), その他

npm-shrinkwrap 使ってる? バージョンってガチガチに固定する? Semver?

## News Source

どこでバージョンアップ知る?
gemnasium的なやつ nodejsweekly

## Example

angularjsを使っていて、使いたいライブラリが低いバージョンのangularjsで固定され
ている
何かを使おうとしたら、バッティングする
速い
セキュリティイシュー
いちおうnpmだと依存は自分の下にインストールするけど、よくわからなくなる

## How

困ったところで都度バージョンを上げる
バージョンを上げる期間を設けて、その期間に全部を上げてテスト、QAする
上げない
上げるのは誰?

## Recommend

製品を使ってくれそうな知人
ソリューションにすぐにお金を支払ってくれようとしたか

朝バージョンアップから始めるとか
最新バージョンに追い付くことのほうが大変なのではないか

# Tachikoma.io

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
