---
pagetitle: PSR-2 Error to GitHub Pull Request Review Comment
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20150327-php-cs-php-study/
lang: ja
description: >-
  PSR-2でLintした結果をGitHubのPull Request上に可視化する。
ogimage: http://sanemat.github.io/talks/20150327-php-cs-php-study/github-pull-request-review-comment.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# PSR-2でLintした結果を見えるようにして、コード品質の最低限を上げる

## TL;DR

* Lintの結果をもっと活用しよう。
* Lintの結果をもっと見えるようにしよう。
* 重要なのはコードを介した対話 (総花的だ)

## Example - PHP Code Sniffer

例えばこのコード、`if`のあとのカッコの前にspaceがない、`if () {} else {}`のbraceがない。

```php
# test.php
<?php
if($a==2)
    echo $a;
else
    echo '3';
```

これをPHP_CodeSnifferでチェックすると、エラーが表示される。

```bash
$ php phpcs.phar --standard=PSR2 test.php

FILE: C:\Users\ishida\src\test.php
--------------------------------------------------------------------------------

FOUND 7 ERRORS AFFECTING 4 LINES
--------------------------------------------------------------------------------

 1 | ERROR | [x] Expected 1 space after closing brace; 0 found
 2 | ERROR | [x] Expected 1 space after IF keyword; 0 found
 2 | ERROR | [x] Inline control structures are not allowed
 2 | ERROR | [x] Whitespace found at end of line
 4 | ERROR | [x] Expected 1 space after ELSE keyword; newline found
 4 | ERROR | [x] Inline control structures are not allowed
 5 | ERROR | [x] Expected 1 blank line at end of file; 2 found
--------------------------------------------------------------------------------

PHPCBF CAN FIX THE 7 MARKED SNIFF VIOLATIONS AUTOMATICALLY
--------------------------------------------------------------------------------


Time: 90ms; Memory: 2.5Mb
```

[PHPのコーディングスタイルをPHP_CodeSnifferで修正する - Qiita](http://qiita.com/iakio/items/4ce17c46e46de80adec7)

コード規約あると何がウレシイかというと、どうでもいいことでのストレスが減らせる。

コードレビューの時間をどうでもいい指摘ばっかりしたくない。どっちでもいいこととか。4space, 2space, tab とか。

どうでもいいことは、指摘もしたくない。機械的に勝手に直されてほしい。

`PHP_CodeSniffer`や`php-cs-fixer`を使おう。

### 正論だがしかし

正論だし、メリットもわかる。ではなんで徹底されない?
単に、ツールやテクノロジーが足りてない。
知ってればわかるだけの話。やろう。

仕事の生産性上げるのは、仕事だ!

## 入力支援

エディタなりIDEなりの手元でガンガン支援受けて直すのが一番いい。

## コマンド

`php-cs-fixer`やPHP_CodeSniffer付属の`phpcbf`。

* [FriendsOfPHP/PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
* [PHP CS Fixerで快適PHPライフ - Fivestar's blog](http://fivestar.hatenablog.com/entry/2014/12/08/033345)
* [コーディング規約自動調整ツールCodeSniffer2とphp-cs-fixer - Qiita](http://qiita.com/dozo/items/ed4baa58a0131945ad6f)
* [PHPコードをコマンドで自動整形! Condig Standards Fixer と PHP_CodeSniffer - Qiita](http://qiita.com/hshimo/items/e8374fe721492ac4658b)

## エディタ

* [stephpy/vim-php-cs-fixer (vim)](https://github.com/stephpy/vim-php-cs-fixer)
* [PHP CS fixerをemacsから使うための関数 (emacs)](https://gist.github.com/shouhei/9005edbfa66470a3a592)
* [benmatselby/sublime-phpcs (sublime)](https://github.com/benmatselby/sublime-phpcs)
* [benmatselby/atom-php-checkstyle (atom)](https://github.com/benmatselby/atom-php-checkstyle)
* [Using PHP Code Sniffer Tool (phpstorm)](https://www.jetbrains.com/phpstorm/help/using-php-code-sniffer-tool.html)
* [PHP features The PDT Extension Group eclipse p2 repository (eclipse)](http://p2-dev.pdt-extensions.org/phpfeatures.html)

良いタイトルが合ったので、持ってきた。

* [PHP コードの整形はプログラマがやるべきことじゃない - Shin x blog(phpstorm)](http://www.1x1.jp/blog/2014/09/code-format-is-not-human-task.html)

## 結果の可視化

### Pull Request Review Comment

こんな感じに、GitHub Pull RequestにReview Commentがつくツールやサービスがある。
この行が長過ぎます、という例。

![review comment](./github-pull-request-review-comment.png 'pull request review comment')

おもにrubyプロジェクトの場合
[Hound(Web Service)](https://houndci.com/),
[Hound(OSS)](https://github.com/thoughtbot/hound),
[Pronto](https://github.com/mmozuras/pronto)
というのを使う。
各言語ごとにいろいろある。言語ごとに実装してるのマヌケっぽい。

* [packsaddle/ruby-saddler](https://github.com/packsaddle/ruby-saddler)

言語中立なのを作った。**Saddler**

#### example - Saddler

プルリクエストに対してテストが走る、その後処理の中で、実行する。

```bash
# TravisCIやCircleCIの after testの中で(travisCI用語でafter_script, CircleCI用語でpost test)
git diff --name-only origin/master \
  | grep ".*.php$" \
  | xargs phpcs --report=checkstyle \
  | checkstyle_filter-git diff origin/master \
  | saddler report \
      --require saddler/reporter/github \
      --reporter Saddler::Reporter::Github::PullRequestReviewComment
```

途中出力

```bash
git diff --name-only origin/master \
  | grep ".*.php$" \
  | xargs phpcs --report=checkstyle

<?xml version="1.0" encoding="UTF-8"?>
<checkstyle version="1.0.0">
 <file name="/path/to/code/myfile.php">
  <error line="2" column="1" severity="error" message="Missing file doc comment" source="PEAR.Commenting.FileComment"/>
  <error line="20" column="43" severity="error" message="PHP keywords must be lowercase; expected &quot;false&quot; but found &quot;FALSE&quot;" source="Generic.PHP.LowerCaseConstant"/>
  <error line="47" column="1" severity="error" message="Line not indented correctly; expected 4 spaces but found 1" source="PEAR.WhiteSpace.ScopeIndent"/>
  <error line="47" column="20" severity="warning" message="Equals sign not aligned with surrounding assignments" source="Generic.Formatting.MultipleStatementAlignment"/>
  <error line="51" column="4" severity="error" message="Missing function doc comment" source="PEAR.Commenting.FunctionComment"/>
 </file>
</checkstyle>
```

と、たぶんなるはずなんだけど、手元にいい感じにsetupしたPHP_CodeSnifferプロジェクト無いので、誰か手伝ってほしい。

#### メリット

* github上に可視化できること。
* コード増分だけに適用出来ること。
* コメントを無視もできるところ。身も蓋もないけど。

#### build phases

* TravisCI (after_script)
    * [Travis CI: Configuring your build](http://docs.travis-ci.com/user/build-configuration/#Build-Lifecycle)
* CircleCI (post test)
    * [Configuring CircleCI - CircleCI](https://circleci.com/docs/configuration#phases)
* Jenkins (post build task)
    * [Post build task - Jenkins - Jenkins Wiki](https://wiki.jenkins-ci.org/display/JENKINS/Post+build+task)
    * [Jenkins でジョブが失敗した時にだけ実行したい処理があった場合の対応パターン - Thanks Driven Life](http://gongo.hatenablog.com/entry/2014/04/01/100236)

## 設定したがしかし

### 設定したら終わりか?
ノー。そこから始まり。
チームがコードをどう考えていくか、をすり寄せ続ける必要がある。

### 重要なのは

重要なのはコードを介した対話だ!

## Saddler 確実に詰まる

設定しかけてわかんなかったらバンバン聞いてください。 @sanemat に。
全員(自分も含めて)シェルスクリプト周りかCIサービス周りで確実に詰まる。

----

## 参照

* [PHPのコーディングスタイルをPHP_CodeSnifferで修正する - Qiita](http://qiita.com/iakio/items/4ce17c46e46de80adec7)
* [PSR-2 — Coding Style Guide](http://www.php-fig.org/psr/psr-2/)
* [新標準PSRに学ぶきれいなPHP](http://www.slideshare.net/yandod/psrphp)
* [More PHP Formatting Options and Bundled Code Styles for PSR-1/PSR-2 and Symfony2 | WebStorm & PhpStorm Blog](http://blog.jetbrains.com/webide/2012/11/more-php-formatting-options-and-bundled-code-styles-for-ps/)
* [PSR-0はなぜ0（≒最重要）なのか - 泥のように](http://blog.tojiru.net/article/278307117.html)
* [PHP CS Fixerで快適PHPライフ - Fivestar's blog](http://fivestar.hatenablog.com/entry/2014/12/08/033345)
* [CakePHP のソースコードのレビュー結果を共有してみる - Qiita](http://qiita.com/waterada/items/5174f771308ffc71b0c7)
* [Saddler](https://github.com/packsaddle/ruby-saddler)
* [jser/jser.github.ioの記事をpull request時にLintする仕組み | Web Scratch](http://efcl.info/2015/03/04/linting-article/)
* [変更したファイルにrubocopやjscsを実行して pull requestに自動でコメントする – Saddler - checkstyle to anywhere](http://packsaddle.org/articles/saddler-overview/)

sanemat {AT} tachikoma.io

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20150327-php-cs-php-study%2F&t=PSR-2%20Error%20to%20GitHub%20Pull%20Request%20Review%20Comment" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20150327-php-cs-php-study
