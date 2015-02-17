---
pagetitle: Saddler - better pronto
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20150217-asakusa-rb-saddler/
lang: ja
description: Saddler - better pronto / Asakusa.rb
ogimage: http://sanemat.github.io/talks/20150217-asakusa-rb-saddler/interval-pull-requests.gif
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Saddler
## better pronto

## Give me advice

* Tool concept
    * other tools?
* Tool name
    * rubygem name, npm name and command
* Tool idea

# Tool concept

## Rubocop

## Pronto

## HoundCI

pronto自体の出来はよい、but 確認しづらいパーツが多すぎる

ruggedとか、gitlabとか、bitbucketとか

ラッパー頑張ってるけど、イマイチ

ラッパーないものとか、別言語とか

diff部分だけをlint これは別のlint作者(vimlint)からの着想だけど、ファイルをやって、プラス分だけやれたほうがいい
たとえば、javascript で `var` で変数宣言してる行を削った場合、など増分diffのlintだけでは出てこない

増分diffの範囲になければ無理だけど！
ちょっと、これは後で考える、github pull request commentに引きずられ過ぎかもしれない

## Saddler

format examples:
https://gist.github.com/sanemat/5416e4f701922a47773a

```
git diff -z --name-only origin/master.. \
 | xargs -0 bundle exec rubocop-select \
 | xargs rubocop \
     --require rubocop/formatter/checkstyle_formatter \
     --format RuboCop::Formatter::CheckstyleFormatter \
 | checkstyle_filter-git diff origin/master.. \
 | saddler run \
     --require github/pull-request-comment-formatter \
     --format Github::PullRequestCommentFormatter
```

```
$ git diff -z --name-only b5ee3a61...origin/master
.gitignore^@.rubocop.yml^@.travis.yml^@Gemfile^@README.md^@bin/console^@bin/setup^@checkstyle_filter-git.gemspec^@example/example1.xml^@example/github-pull-requests-files-response.json^@example/invalid.rb^@exe/checkstyle_filter-git^@lib/checkstyle_filter/git.rb^@lib/checkstyle_filter/git/cli.rb^@lib/checkstyle_filter/git/diff_parser.rb^@

$ git diff -z --name-only b5ee3a61...origin/master \
 | xargs -0 rubocop-select
/Users/sane/work/ruby-study/checkstyle_filter-git/checkstyle_filter-git.gemspec
/Users/sane/work/ruby-study/checkstyle_filter-git/Gemfile
/Users/sane/work/ruby-study/checkstyle_filter-git/bin/console
/Users/sane/work/ruby-study/checkstyle_filter-git/example/invalid.rb
/Users/sane/work/ruby-study/checkstyle_filter-git/exe/checkstyle_filter-git
/Users/sane/work/ruby-study/checkstyle_filter-git/lib/checkstyle_filter/git/cli.rb
/Users/sane/work/ruby-study/checkstyle_filter-git/lib/checkstyle_filter/git/diff_parser.rb
/Users/sane/work/ruby-study/checkstyle_filter-git/lib/checkstyle_filter/git.rb

$ git diff -z --name-only b5ee3a61...origin/master \
 | xargs -0 rubocop-select \
 | xargs rubocop \
     --require rubocop/formatter/checkstyle_formatter \
     --format RuboCop::Formatter::CheckstyleFormatter
<?xml version='1.0'?>
<checkstyle>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/checkstyle_filter-git.gemspec'/>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/Gemfile'/>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/bin/console'/>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/example/invalid.rb'>
    <error line='3' column='100' severity='info' message='Line is too long. [188/100]' source='com.puppycrawl.tools.checkstyle.Metrics/LineLength'/>
  </file>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/exe/checkstyle_filter-git'/>
  <file name='/Users/sane/work/ruby-study/checkstyle_filter-git/lib/checkstyle_filter/git/cli.rb'>
    <error line='14' column='6' severity='info' message='Assignment Branch Condition size for diff is too high. [54.73/15]' source='com.puppycrawl.tools.checkstyle.Metrics/AbcSize'/>
(snip)

$ checkstyle_filter-git diff b5ee3a61...origin/master

$ saddler run \
  --require github/pull-request-comment-formatter \
  --format Github::PullRequestCommentFormatter
```

これのメリット

* 確認しづらいパーツが減る
* コマンドラインツールならなんでもいける(jscs, eslint, etc.)
* travis-ci, circle-ciでサクサク動く(はず)

# Tool name
## rubygem name, npm name and command

# Tool idea


[Tachikoma.io][tachikoma-io]

sanemat {AT} tachikoma.io

<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20150217-asakusa-rb-saddler%2F&t=Saddler%20-%20better%20pronto%20%2F%20Asakusa.rb" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20150217-asakusa-rb-saddler
