---
pagetitle: Changelog for Ruby Module
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20151130-conventional-changelog-for-ruby/
lang: ja
description: Changelog for Ruby Module / Lightning Talks
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Changelog for Ruby Module

sanemat {AT} tachikoma.io


## changelog 読んでる?

* gemを使うときにreadme見る人
* gemを使いはじめるときにchangelog見る人
    * `changelog.md`
    * `github.com/{:repos}/releases`
    * `github.com/{:repos}/compare/{:base}...{:head}`
* gemのバージョンアップするときにchangelog見る人
* changelogのないgemのバージョンアップしなくちゃで、バカかな? とおもうけど、自分の書いたモジュールにはチェンジログない人?
* semvarって聞いたことある人?
* gemのpre-releaseのフォーマットがsemvarじゃなくって、あれ。。？ってなったことある人
    * semvar: 2.3.4-alpha1
    * gem pre-release: 2.3.4.alpha1

結論として、ユーザーは見てるし、changelog補助のツールもあるのでいろいろ使いましょう

## changelog補助のツール, gemとは?

日本語、gem, changelog, の組み合わせだとこれが参考になる。
[社内gemとOSSのgemのメンテについて - くりにっき](http://sue445.hatenablog.com/entry/2015/12/01/000000#CHANGELOG更新履歴を書く)

github-changelog-generatorにwikiページがあり、そこに比較がある。
[Alternatives · skywinder/github-changelog-generator Wiki](https://github.com/skywinder/Github-Changelog-Generator/wiki/Alternatives)
比較自体はちょっと古い気もする(conventional-changelogがgithub integrationなしになってる)けど。


## ブラウザから読みやすい VS gem packageに含まれている

ブラウザから読みやすい VS gem packageに含まれている

確かに一番読みやすいのはキチンと書かれた GitHub releases

しかしやっぱりgem packageにchangelog.md入れたい気持ちがある

GitHub落ちてたらどうするの、とか、政治的に中立なところにあったほうが良い気がする、とか。

GitHubはProgressive Enhancement 的な


## パッケージング順番

となると必然、

バージョンアップの準備が整う

-> バージョン番号インクリメント, changelog書く(順不同)

-> bundle exec rake release

(rake release内部でbuild, git tag, push to github, push to rubygems)

重要なのは、package moduleする前に、changelogを書きたいということ。
そして、package moduleとgit tagはほぼ同時(になってしまう)こと。


## Changelog toolchain

各言語でchangelogツールチェーンの取り組みはいくつもあって選びにくいが
E.g [社内gemとOSSのgemのメンテについて - くりにっき](http://sue445.hatenablog.com/entry/2015/12/01/000000#CHANGELOG更新履歴を書く)

手を入れやすくてよく出来ているもの、パッケージングの順番も考慮でき、gem packageにふくめやすいもの。
私見では`conventional-changelog`。


### conventional-changelog


TDDのt_wadaさんおすすめ。
[OSS についてあれこれ](http://www.slideshare.net/t_wada/javajaoss/42)
jser.infoのazuさんおすすめ。
[われわれは、いかにして変更点を追うか](http://azu.github.io/slide/cto/changelog.html)

```text
                       component        commit title
        commit type       /                /
                \        |                |
                 feat(ngInclude): add template url parameter to events

        body ->  The 'src` (i.e. the url of the template to load) is now provided to the
                 `$includeContentRequested`, `$includeContentLoaded` and `$includeContentError`
                 events.

 referenced  ->  Closes #8453
 issues          Closes #8454
```

規約に従ってコミットログを書くと、そこからchangelogを生成する。
細かい変更はchangelogに載せない、など。
規約は自分で決められるが、presetとしてangularjsやjqueryのものがある。
[conventions](https://github.com/ajoslin/conventional-changelog/tree/893d764f2396ff9f70d1e8f38051f2e847bbafca/conventions)
おすすめはangularjs。
一部抜粋すると

> Type
>
>If the prefix is feat, fix or perf, it will always appear in the changelog.
>
>Other prefixes are up to your discretion. Suggested prefixes are docs, chore, style, refactor, and test for non-changelog related tasks.

これで、typeごとにまとまったchangelogが出来る。

これいいじゃん!

でもNode.jsなんだよねー


#### conventional-changelogへの疑問

commit commentの書式強制ってOSSできつくない?

きついとおもう。

commit comment強制するぐらいなら、changelog書かせてもいいのでは?

そうかもしれない。

committerが取り込むときに手で修正するのは不毛すぎるし、ミスもありそう。

せやな。

jqueryとかangularjsとかどうしてるんだろう?


#### 私見

こういう細かいツールチェーンはnodejsに乗ればよくない？

ちょっと前は、同じ機能のもの後から車輪の再発明しおって!(rakeとかsassとか)と若干思ってたけど
最近はgolangやnodejsで書いて、shellやcmd.exeからどう使うか考えればいいのでは、という方にマインドが傾いている。

私見終わり

#### changelog range

ココカラ、ココマデ、のうち、ココカラ、はgit tagから取るので問題ない。
よくあるツールで、ココマデ、をgit tagから取ってしまうのが多い。
でも、tag打つ前にchangelog書きたいので、ココマデをgit tagから取ってしまうのは、使いたい条件を満たさない。
引数なり設定なりで渡せればいいかも。
`conventional-changelogは`ココマデをデフォルトではpackage.jsonから取得してしまう。
どうしても言語依存になってしまう?

しかし、設定がjsでかけるので、問題ない。

問題ない？


### Ruby moduleからconventional-changelogを使う part1

```
$ echo '{}' > package.json
$ npm i --save-dev conventional-changelog
```

バージョンのファイルをrequireして、printすればいいね。
host, owner, repositoryもいったん手書きすればいいね。

```
# .conventional-changelog.context.js
'use strict';
var execSync = require('child_process').execSync;
var version = "" + execSync('ruby -e \'require "./lib/saddler/reporter/github/version"; print Saddler::Reporter::Github::VERSION\'');
var host = 'https://github.com';
var owner = 'packsaddle';
var repository = 'ruby-saddler-reporter-github';

module.exports = {
  version: gemspec.version,
  host: host,
  owner: owner,
  repository: repository
};
```

```
$ node_modules/.bin/conventional-changelog -i changelog.md --overwrite --preset angular --context .conventional-changelog.context.js
```

こういうのが生成できる

```md
<a name="0.2.0"></a>
# [0.2.0](https://github.com/packsaddle/ruby-saddler-reporter-github/compare/v0.1.6...v0.2.0) (2015-10-02)


### Features

* **patch:** use inherited patch, patches ([05e2306](https://github.com/packsaddle/ruby-saddler-reporter-github/commit/05e2306))
* **repository:** use inherited repository ([3834b1f](https://github.com/packsaddle/ruby-saddler-reporter-github/commit/3834b1f))



<a name="0.1.6"></a>
## [0.1.6](https://github.com/packsaddle/ruby-saddler-reporter-github/compare/v0.1.5...v0.1.6) (2015-10-02)

* Improve document.


<a name="0.1.5"></a>
## [0.1.5](https://github.com/packsaddle/ruby-saddler-reporter-github/compare/v0.1.4...v0.1.5) (2015-09-21)

#### Features

* **client:** Compatibility to Jenkins Pull Request Builder ([56fa18d](https://github.com/packsaddle/ruby-saddler-reporter-github/commit/56fa18dd8cef23bb5579971abc087d31de28adf4))
```

はじめだけちょっと頑張ると、あとはツールの流れに乗れるのでよいですね。


### Ruby moduleからconventional-changelogを使う part2

とはいえ、moduleごとに違う場所にあるversionのファイル探して、requireして printするのツライ。
homepageもgemspecと二重管理になるのでツライ。version同様定数に持たせてもいいけど、あんまり。

```ruby
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/select/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-select'
  spec.version       = RuboCop::Select::VERSION
  spec.homepage      = 'https://github.com/packsaddle/rubocop-select'
(snip)
```

そこで、だいたいこうなっている.gemspecをparseしていい感じのpure ruby hashにする  parse_gemspec と、そのcliのparse_gemspec-cli を使う。

```
$ parse-gemspec-cli checkstyle_filter-git.gemspec | jq .
{
  "name": "checkstyle_filter-git",
  "version": "1.0.3.pre.beta",
  "homepage": "https://github.com/packsaddle/ruby-checkstyle_filter-git"
}
```

cliは、JSONとしてoutputするので、あとは言語中立。

```
'use strict';
var execSync = require('child_process').execSync;
var gemspec = JSON.parse(execSync('bundle exec parse-gemspec-cli parse_gemspec-cli.gemspec'));

module.exports = {
  version: gemspec.version
};
```
こう使える。

[conventional-changelog(npm)をRuby pruductから使う | 實松アウトプット](https://sanematsu.wordpress.com/2015/09/25/use-conventional-changelog-on-ruby-product/)

最終的にこうなって

```
# .conventional-changelog.context.js
'use strict';
var execSync = require('child_process').execSync;
var URI = require('urijs');

var gemspec = JSON.parse(execSync('bundle exec parse-gemspec-cli saddler-reporter-github.gemspec'));
var homepageUrl = gemspec.homepage;
var url = new URI(homepageUrl);
var host = url.protocol() + '://' + url.authority();
var owner = url.pathname().split('/')[1];
var repository = url.pathname().split('/')[2];

module.exports = {
  version: gemspec.version,
  host: host,
  owner: owner,
  repository: repository
};
```

```
# package.json
{
  "devDependencies": {
    "conventional-changelog": "0.4.3",
    "urijs": "^1.16.1"
  },
  "scripts": {
    "changelog": "conventional-changelog -i CHANGELOG.md --overwrite --preset angular --context .conventional-changelog.context.js"
  }
}
```

となり、

バージョンアップの準備が整う

-> バージョン番号インクリメント, changelog書く(`$ npm run changelog`) (順不同)

-> bundle exec rake release

これが実現できる。


## まとめ

changelog半自動生成のツールを使って、楽にchangelogを書こう。
おすすめは`conventional-changelog`です。



<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151130-conventional-changelog-for-ruby%2F&t=Changelog%20for%20Ruby%20Module%20%2F%20Lightning%20Talks" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>
