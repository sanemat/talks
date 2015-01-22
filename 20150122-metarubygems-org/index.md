---
pagetitle: Metarubygems.org - Yet Another Rubygems.org
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20150122-metarubygems-org/
lang: ja
description: Metarubygems.org - Yet Another Rubygems.org / Fukuoka.rb #27
ogimage: http://sanemat.github.io/talks/20150122-metarubygems-org/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Metarubygems.org

## 自己紹介

sanemat サネマツ

フクオカRuby大賞 本審査のため来た

無職なのでモツ鍋食べたりとんこつラーメン食べたり

1/26(月)まで福岡にいる

これ食べておくとイイ これ見ておくとイイ 募集中

### done

- 元祖博多麺もつ屋
- ツナパハ カレー
- 博多一幸舎
- 八ちゃんラーメン

### yet

- 水炊き 新三浦天神店

### しない話

「Tachikoma.io」

* Ruby/Railsアプリケーションを
* 健全に保つ
* 一番痛みが少ない
* Bundle Update as a Service
* [Tachikoma.io][tachikoma-io]

## Rubygems.org

Rubygems.orgに不満があって、ぼくのかんがえたさいきょうのrubygems.org APIつくろうとしてる

誰か一緒にやらない? or 何かアイデアあったら一緒にやりたい

お金稼ぐモデルは思いつけてない

## Rubygems.org現状確認

[Rubygems.org](https://rubygems.org/)

e.g. [activerecord](https://rubygems.org/gems/activerecord)

便利
見た目が改善した(?)

webを使うシチュエーションって無くない?

必要なところが右下に追いやられている

readme無い

file api 無い

diff api 無い

diff見えたら、次はcommitごとのdiffが見たくなる
-> githubで見る
-> 最初からgithubでいいのでは

どのrubyバージョンでtest通してるとか

どの組み合わせ, たとえばactiverecord v3.2とv4.2でtest通してるとか

source_code_url

activerecordのsource_code_urlってどこ

gitのtagって任意なので、pushされないこともある

単に忘れている場合も多い

命名規則

gemのversioningは 1.9.6 とかなのにtagの命名は自由度高い

半分以上はv0.0.0命名だけど、v0.0 命名もある これは許容されてそう

あとはvなしの0.0.0命名

rakeの自由さ e.g. rake-10.1.1

v10.2.0以降はv0.0.0になったっぽい(?) やった

CORS対応 遅すぎて自分で作る気になったんだけど、結局入ってない??マジで?

> CORS(Cross-Origin Resource Sharing)は、その名の通り、ブラウザがオリジン(HTMLを読み込んだサーバのこと)以外のサーバからデータを取得する仕組みです。
> [CORS(Cross-Origin Resource Sharing)によるクロスドメイン通信の傾向と対策 ｜ Developers.IO](http://dev.classmethod.jp/cloud/cors-cross-origin-resource-sharing-cross-domain/)

[Allow client side javascript to access rubygems API show action by JohnColvin](https://github.com/rubygems/rubygems.org/pull/592)

rack-cors使うなど

## 不満を解消するプロジェクトたち

### [handcooler.org](http://handcooler.org)

### ruby-toolbox.com

ruby-toolbox.com への不満

メンテナンスされてない(?)

### bestgems.org

[BestGems.org](http://bestgems.org/)

### omniref.com

[Ruby Documentation Search - Omniref](https://www.omniref.com/)

omnirefめっちゃ期待してる

## 他の言語

### [npm](https://www.npmjs.org/)

[browserify](https://www.npmjs.com/package/browserify)

### [cpan](https://cpan.org/)

[DBIx::Skinny](https://metacpan.org/pod/DBIx::Skinny)

## MetaRubygems.org

### files API

[files?target=activesupport-4.1.0&filename=README.rdoc](http://raw.metarubygems.org/v1/files?target=activesupport-4.1.0&filename=README.rdoc)

### diffs API

[diffs?from=activerecord-4.1.0&to=activerecord-4.1.8](http://raw.metarubygems.org/v1/diffs?from=activerecord-4.1.0&to=activerecord-4.1.8)

### 進捗

herokuのハッカソンで運営資金もらうぞーとおもったけど、1円ももらえなかった

sakura vpsの4G 初期費用4300円月額4000円を吸われ続けていくことになってしまった。

ひとまずTachikoma.ioでスポンサーする。

これは、rubygems.orgはgemごとのreadmeが見えないのと、diffをgithubにいちいち探しに行くのがツライので、[HandCooler: Yet Another Rubygems.org](http://handcooler.org/)以前作った。

でも自分で使うにも帯に短しだったので、やっぱ自分でgemを保持するか!という気持ちになった。

rubygems.orgと同じmeta情報取れるようにするのと、file api, diff api, readme apiまでは構想ある。

ぼくのかんがえたさいきょうのAPI、というところまでは自分で作りきらないとな。未完。

[Tachikoma.io][tachikoma-io]

sanemat {AT} tachikoma.io

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20150122-metarubygems-org%2F&t=Metarubygems.org%20-%20Yet%20Another%20Rubygems.org%20%2F%20Fukuoka.rb%20%2327" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20150122-metarubygems-org
