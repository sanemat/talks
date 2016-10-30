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

mastering bitcoinを読んでくれ! 以上

### ランダムウォレット(非決定性ウォレット)

ウォレットはランダム生成した秘密鍵の束

### 決定性ウォレット

ウォレットで共通のseedから一方向ハッシュで秘密鍵生成

### HD wallet(Hierarchical Deterministic Wallet)

seedからmaster key生成、そこからツリー上にchild keys, grandchild keys と生成

(mastering bitcoinからコピペ)

> ツリー構造に情報付加できる
> ユーザーが秘密鍵に触れることなく公開鍵を生成できる


## 気になるところ

> 拡張公開鍵がchain codeを含んでいる

拡張公開鍵って「公開鍵」って言いつついろいろ出来てしまうので、ふつうにsshの公開鍵みたいに全世界に公開していいの?
って問題意識とも関連してくるんだけど

> 拡張公開鍵はchain codeを含んでいるため、もし子秘密鍵が知られているまたは漏洩してしまった場合、
このchain codeを使ってその他すべての子秘密鍵を導けてしまう
> このリスクへの解決策として、HDウォレットは hardened child key derivation 強化子公開鍵導出 関数を使っている
> もし拡張公開鍵の利便性を使い、しかもchain codeの漏洩リスクを回避したいのであれば、通常の親(親公開鍵)ではなく、
> 強化された親(親秘密鍵)から拡張公開鍵を導出すべきです。
> ベストプラクティスとしては、マスターキーの1階層目の子供を常にhardened derivationを通して導出されるようにしておくことが良いでしょう。

なんか小さくベストプラクティスが書いてあるが、一般に使われるクライアントは、みんなこれやってると思っていいんだろうか…

## UTXO

UTXO (unspent transaction output)

だいたいのwalletでwallet.balance() とかでとれるやつ

ここまで来てやっと意味がわかった。
walletは未使用含めてbitcoinアドレスを持っていて(作成できて)、それにはpathに0とか1とか2とか順に名前がついてて、pathは小さい順から使う暗黙ルールがあるらしい(未確認)
なぜなら、未使用が20個続いたら探索打ち切り、などがウォレットアプリ側で実装されている
なので、条件に依っては、あるウォレットで見つからなくなってしまったbitcoinが、アドレスの使用数が進んだら出てくることもあるようだ(未確認)

ツリー状のはどうたどるんだ? これがbitcoin-explorer って名付けられてるタイプのライブラリの仕事なのかな (未調査)

## まとめ

俺たちの戦いはこれからだ!!

ツールを作ると学習が進む(作れてない)


## ヨタ話

プログラム言語は何で実装見てたんですか

Nodejsです

golang学習がてらやろうとしたら全然そんな余裕がなく、土地勘のあるrubyとnodejsだとnodejsにライブラリが結構あった。
bitcoin coreがC++だし、C++が一番楽なのでは。俺書けないけど。
それかpython。俺書けないけど。
btcdがgolangだからgolangもよさそう。俺書けないけど。
ほんとはgolangでbitcoinプロトコルしゃべろうと思ったんだ…

nodejsでなんとなく見たのは

- bitcoinjs-lib
- bitcore-lib (bitpay.io)
- bcoin (purse.io)

この順番がリリース順で、APIの洗練され具合も下が良い。
あと、full nodeかSPV nodeか、web serviceとの連携具合とかが違う。
なんだけど、npmソムリエ的には、おすすめは上から下。

ただいずれにしてもそこまでアクティブではないように見える。一応メンテはされてる。

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20161101-hierarchical-deterministic-wallet%2F&t=Hierarchical%20Deterministic%20Wallet%20%2F%20Bitcoin%20etc%2C%20%232" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>
