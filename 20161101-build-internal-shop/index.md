---
pagetitle: やってみなくてもわかるbitcoin専門社内おやつ商店のまなび / Bitcoin etc #2
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20161101-build-internal-shop/
lang: ja
description: やってみなくてもわかるbitcoin専門社内おやつ商店のまなび / Bitcoin etc #2
ogimage: http://sanemat.github.io/talks/20161101-build-internal-shop/shiba-shop.jpg
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# やってみなくてもわかるbitcoin専門社内おやつ商店のまなび

sanemat {AT} tachikoma.io

ぼくは自分でやってみないとわからなくて、やってみて学んだので、やってみなくても持って帰れるようにしました


bitcoin専門社内おやつ商店 芝商店
![shiba-shop](./shiba-shop.jpg)

## Mastering bitcoin

[![mastering-bitcoin](./mastering-bitcoin.jpg)](https://www.bitcoinbook.info/translations-of-mastering-bitcoin/)

[ビットコインとブロックチェーン:暗号通貨を支える技術](https://www.amazon.co.jp/dp/4757103670)

- 名前聞いたことある人
- 読んでみた人
- 訳してみた人
- 読んでみたい人

[Translations of Mastering Bitcoin](https://www.bitcoinbook.info/translations-of-mastering-bitcoin/)

CC BY-SA

pdf版は組版が読みづらい あとは、android版のpdf readerの出来とか…
reader探しを始めたり、翻訳プロジェクトのアカウント作っておっかなびっくり差分投げたりするはめになります

[ビットコインとブロックチェーン:暗号通貨を支える技術](https://www.amazon.co.jp/dp/4757103670)

日本のオライリーから出てるかと思って探したんだけどなくて、エヌティティ出版からでした。
買うといいんじゃないですか。自分は買ってないです。

## 疑問点

読んでいろいろわかんないわけですね。

感想探してみた。

- [Mastering Bitcoin（日本語訳 PDF）を読んで解決した疑問点、しなかった疑問点 - 無印吉澤](http://muziyoshiz.hatenablog.com/entry/2016/02/25/011117)

web屋っぽい人の感想 近いところにいるはずなのに俺より全然レベルたけーな おれもっといろいろわかんなかった…


## 自分の興味

よく決済手数料が激安に済むとか中央で通貨管理しなくていいとか聞くけど、実際どうで現状どうか

## 社内おやつ商店

bitcoin専門社内おやつ商店 芝商店
![internal-shop](./shiba-shop.jpg)

社内に既存のおやつ商店がある
その隣を勝手に陣取って、
品物仕入れてきて、かごに入れて、紙にビットコインアドレスQRコード貼って固定額2000bitsで売る。以上


## 結果

- 面白がって買ってくれる人が社内に自分以外に2人いた
- 社内esa.ioはコメントとスター結構ついたけど、買う人は増えない
- bitcoinを買ったことある人はいてもmobileウォレット誰ももってねえ
- 紙のQRコードの読み取り性能がだいぶつらい
    - これは自分の問題か
- 紙だから1個のアドレスを使い回すはめになり、アドレスと人がひも付きやすい
    - 匿名性とは
    - これそのまま1個のアドレスを使い回す危険性の話
- 0回confirmで持っていけることにした
    - かごの仕組み上もともとただで持っていけるし
    - スタバでbitcoin決済するとして1-3回confirmまで待つって無理くないですかね
- blockchain.info (ビットコインのアドレスの送金ヒストリーやblockchainの情報が見れるサイト) のurlを貼ってくれた方がいて、明朗経営が実現
- bitcoinで仕入れらんねえ
    - そこで[コインギフト | モナーコイン・ビットコインでAmazonギフト券・iTunesカードが買える！](https://coingift.jp/) ですよ
    - おっそうだな
- 自分のクレカで仕入れて、商店のウォレットから自分のウォレットに送信
- 商店のウォレットは自分で管理 複数ウォレット使えるアプリを使った
- HD walletにして拡張公開鍵だけ入れておけば送金できないウォレットが出来るかと思ったら、送金の依頼っぽいリクエストが出せる(後述)
- モバイルアプリのトランザクションフィー、アプリにも依るが最低限よりだいぶ高い
- 十数円、数十円の決済には向かねーな
    - ユーザーが手数料決めるって構造の課題なのかも
    - 普段自分は決済手数料意識することない 銀行の振込手数料はなんかいろいろ駆使して無料の範囲で収める

## 学び

- 実際にどういう流れでどういう処理が行われるか
- transactionの各項目の意味がなんとなくわかる
- モバイルアプリの使い勝手
- 何が公開してよくて何が公開していけない情報なのか

## 結論

学びましたじゃなくて学んだことを伝えろよ!

それはやってみるしか…

やってみてからmastering bitcoin読み直すとさくさく頭に入ってくる(部分もある)

## おもしろ

- 自分で仕入れてきてほぼ自分で買う羽目になった
- 既存の社内商店のとなりに陣取ったので、弊商店からおやつをとって既存の商店に入金する事案
- 薬局で買ってボッタクリで売ったので店自体は黒字 ほぼ自分で買ったので実情は???
- 新たなライバル商店の出現


<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20161101-build-internal-shop%2F&t=%82%E2%82%C1%82%C4%82%DD%82%C8%82%AD%82%C4%82%E0%82%ED%82%A9%82%E9bitcoin%90%EA%96%E5%8E%D0%93%E0%82%A8%82%E2%82%C2%8F%A4%93X%82%CC%82%DC%82%C8%82%D1%20%2F%20Bitcoin%20etc%20%232" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>
