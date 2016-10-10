---
pagetitle: Build UXTO cli
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20161101-build-uxto-cli/
lang: ja
description: Build UXTO cli / Bitcoin etc, #2
ogimage: http://sanemat.github.io/talks/template/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Build UXTO cli

sanemat {AT} tachikoma.io

このアプローチが正しいかもよくわからん

bitcoin core

リファレンス実装、全部入り

bitcoin-cli

bitcoin core json-rpc api

pycoin

btcd

[btcd: Not your mom’s Bitcoin daemon | Conformal Systems, LLC.](https://blog.conformal.com/btcd-not-your-moms-bitcoin-daemon/)

やりたいアプローチはコレに近いんだけど、コマンドラインでワンタイムにやりたいっすね

[bitpay/bitcore-wallet-service: A multisig, HD wallet service. Used by Copay.](https://github.com/bitpay/bitcore-wallet-service)

bitpayって人たちがnodejsでやってる

自分がかけるのはRubyとNodejsだから、bitpayのプロダクトcopayとかはドンピシャなんだけど、まあgolangでかいてみるかなーっていう。
golang勉強がてら。

んで、拡張公開鍵は相手のサービスに預けたくないわけで、それを保持したままUXTOを集めたい。
golangのデータ構造に閉じ込めて、インメモリとかで。と思ったけどpostgresかなんかにつめておくほうが楽かもしれない? わかんない
ちょっとやってみよう

testnetとやらで試してみる。

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20150217-shibuya-rb-saddler%2F&t=Saddler%20-%20better%20pronto%20%2F%20Shibuya.rb" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20150217-shibuya-rb-saddler
