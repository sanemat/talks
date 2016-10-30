---
pagetitle: Hierarchical Deterministic Wallet
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20161101-hierarchical-deterministic-wallet/
lang: ja
description: Hierarchical Deterministic Wallet / Bitcoin etc, #2
ogimage: http://sanemat.github.io/talks/20161101-hierarchical-deterministic-wallet/shiba-shop.jpg
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Hierarchical Deterministic Wallet

sanemat {AT} tachikoma.io

## 経過

やってみてるけど、俺たちの戦いはこれからだ!ってかんじ。
できてるか出来てないか微妙なとこですね。資料作成時点ではできてない。
作る過程でいろいろ調べた。

### 自分の理解

あやふやなところもあるから間違ってたら突っ込んでね

## アドレスの固定

さっきbitcoin専門社内おやつ商店の話で、1アドレスを紙に書いてしまった話をした。

![おやつ商店](./shiba-shop.jpg)

ビットコインアドレスって、使い捨てにしたほうがいい。
取引金額なんてバレてもいーじゃんってはじめは思う。
こちらのセキュリティ的な話。相手のセキュリティ的な話。51%攻撃受けやすくなる。

表示側もワンタイム生成のアプリにすべきですな。

着金したかどうかってどうやってわかるんじゃろう
hdwalletにして、拡張公開鍵だけ入れておけばいいのでは?
一見良さそうに見えた。

アプリ側の実装によるのかもしれないが、copay androidアプリからだと、拡張公開鍵だけで送金「依頼」のようなものが出せた。
wallet client側の見た目の数字は減って、秘密鍵を持っているアプリに、「この送金をverifyしますか y/n」のようなダイアログが出て、yを押したら送金処理になった。
もちろんnを押したり、無視したりすれば送金されないが、ちと、ちと。

## HD Walletと BIP0032/BIP0044の説明

HD wallet(Hierarchical Deterministic Wallet) 階層的決定性ウォレット




<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20150217-shibuya-rb-saddler%2F&t=Saddler%20-%20better%20pronto%20%2F%20Shibuya.rb" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20150217-shibuya-rb-saddler
