---
pagetitle: Tachikoma next
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20151210-tachikoma-next/
lang: ja
description: Tachikoma next
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>


# Tachikoma next

sanemat {AT} tachikoma.io

* Write shell script or ruby script. tachikoma gem is going to dead.
* We got ready for essential tools.
* tachikoma gemはしにつつあるのでshell scriptかruby scriptで書け
* 必要なツールは用意した


## Bundle update regularly, frequently

### 2013-05-31 - Kensuke Nagae @kyanny

[Continuous gem dependency updating with Jenkins and Pull Request](https://speakerdeck.com/kyanny/continuous-gem-dependency-updating-with-jenkins-and-pull-request)

### 2013-06-23 - Kenichi Murahashi @sanemat

[Tachikoma gem first version v2.0.0 (not published)](https://rubygems.org/gems/tachikoma) [commit](https://github.com/sanemat/tachikoma/commit/a813fc718d43139820d36a20dfd8595958f6b4e8)

### 2014-09-17 - Kenichi Murahashi @sanemat

[Release announce about tachikoma.io](http://sanemat.github.io/talks/20140917-travis-ci-meetup-tachikoma-io/)

## Motivation

* Writing shell script is hard
* Many products / projects have almost same script

* shell scriptで書くのがそもそもツライ
* ほぼ同じスクリプトがプロジェクトごとに散らばるのでツライ

## Tachikoma gem

### pros

* write yaml, we can run command line with gems.
* yamlの設定を置くと、gemとコマンドラインで完結する

### cons

* Not customizable enough
* Build your own execute environment
* First I image that I run this in own jenkins
    * CI as a service advances rapidly

* カスタマイズ性低い
* 実行環境は自分で作成する必要がある
* 設計思想として、自前jenkinsで動かすのを第一に考えていた
    * CI as a serviceの発展


## tachikoma.io

### pros

* Easy to use with GitHub oAuth, and toggle from webUI
* Configure by .tachikoma.yml
* GitHub oAuthで連携, webUIからtoggle一発
* .tachikoma.ymlで設定

### cons

* Too hard to get user's permission about reading/writing on public/private repo
* In public version, user can choose permitting "public write", only I use this feature (user count is over 300)
* Choose "public write" is very useful because I can stack my commit above bot commit.
* Not customizable enough

* リポジトリの読み書き権限もらうのが非常に苦戦
* public版も、ユーザー権限でpush出来るようにするものはあるが、300+のユーザー中利用者1(自分のみ)
* ユーザー権限でpushできると、botのcommitの上に自分のコミット詰めるので、すごい便利なのだが…
* カスタマイズ性低い


## Swinging back

揺り戻し

* shell script and ruby script is enough
* shell scriptやruby scriptで書けばいいじゃん

But

しかし

Still hard

やっぱりつらい

Why? I know I can use Octokit.rb and use GitHub API. But...

shell script or Ruby scriptで書くの何がツライのか
直にOctokit使えばいいだけなのわかるけど、いちいちAPI調べてとかダルい


## Improve usability, concentrate on issue

対象を絞ってより使いやすくするアプローチ

### Ruby gem case

* [deppbot](https://www.deppbot.com/) webservice
* [circleci-bundle-update-pr](https://rubygems.org/gems/circleci-bundle-update-pr) gem
* [ci-bundle-update](https://rubygems.org/gems/ci-bundle-update) gem


### Node.js npm case

* [greenkeeper](http://greenkeeper.io/) webservice


## Opinion & Experience

ここから知見 + 私見 + 主張

"I want to customize!" appears infinitely, depends on qualities of project and product.

カスタマイズ欲求がプロジェクト・プロダクトの特性によって無限に出てくる(はず)

* Use mongodb
* Use mecab (additional libraries)
* Only business day morning
* No Ruby or Rails project on top level on project
* Multi Ruby projects
* Use npm with same way

* mongodb使いたい
* mecab使いたい
* 頻度は平日の朝に来て欲しい
* プロジェクト構成が、トップレベルにRubyやRails来てない
* 複数Rubyプロジェクトが入っている
* Node.js npmもやりたい

* This is re-invent Travis-ci and CircleCI!?

これは、travis-ci, CircleCIを再発明することになるのでは??

Move to application of CI native

CI nativeのアプリケーションへ

Run on CI is enough.

CI上で動けばいいじゃん


### Going on ahead; Is "bundle update as a service" unnecessary?

先回り では、bundle update as a serviceは不要?

So tachikoma.io and deppbot are unnecessary? Are you shut down tachikoma.io?

では、tachikoma.ioやdeppbotは不要なのか? tachikoma.io止めちゃうの?

It is too hard to write scripts at all.
The setting is difficult, even me.
tachikoma.io is useful at all :)

やっぱり、スクリプト書くのめんどい…
設定メンドイな…わかってる自分でやるのもメンドイぐらいなので、他の人はたぶんできないな
やっぱtachikoma.io便利だな

I need tachikoma.io !

自分には必要!

Especially for small modules like gems and npms.

とくに、gemやnpmのような小さいモジュールには。


### a conclusion

結論

Kick `bin/bundle-update.sh` or `bundle-udpate/bin/bundle-update.rb`
by [Cron for GitHub](http://packsaddle.org/articles/cron-for-github-app-overview/) or [AWS Lambda Scheduled Event](https://docs.aws.amazon.com/lambda/latest/dg/with-scheduled-events.html).

`bin/bundle-update.sh`あるいは`bin/bundle-update.rb`を
[Cron for GitHub](http://packsaddle.org/articles/cron-for-github-app-overview/) あるいは[AWS Lambda Scheduled Event](https://docs.aws.amazon.com/lambda/latest/dg/with-scheduled-events.html)でkickする。


#### `bin/bundle-update.sh`

```bash
#!/usr/bin/env bash
set -ev

# only sunday
if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" =~ ^cron_for_tachikoma/.* && $(date +%w) -eq 0 ]]; then
  # gem prepare
  gem install --no-document git_httpsable-push pull_request-create

  # git prepare
  git config user.name sanemat
  git config user.email foo@example.com
  HEAD_DATE=$(date +%Y%m%d_%H-%M-%S)
  HEAD="tachikoma/update-${HEAD_DATE}"

  # checkout (for TravisCI)
  git checkout -b "${HEAD}" "${TRAVIS_BRANCH}"

  # bundle install
  bundle --no-deployment --without nothing --jobs 4

  # bundle update
  bundle update

  git add Gemfile.lock
  git commit -m "Bundle update ${HEAD_DATE}"

  # git push
  git httpsable-push origin "${HEAD}"

  # pull request
  pull-request-create
fi

exit 0
```

#### `bin/bundle-update.rb`

あとでかく TBD

`bundle-udpate/Gemfile`

```ruby
```

`bundle-udpate/bin/bundle-update.rb`

```ruby
```

`cd bundle-update && bundle exec bin/bundle-update.rb && cd ..`


#### Example

[sanemat/ruby-example-rails-banana](https://github.com/sanemat/ruby-example-rails-banana)


#### We got ready for essential tools

細かいのいろいろ作ったので検討してくれ

* [compare_linker_wrapper](https://rubygems.org/gems/compare_linker_wrapper)
* [saddler](https://rubygems.org/gems/saddler)
* [env_branch](https://rubygems.org/gems/env_branch)
* [parse_gemspec-cli](https://rubygems.org/gems/parse_gemspec-cli)
* [parse_gemspec](https://rubygems.org/gems/parse_gemspec)
* [github_status_notifier](https://rubygems.org/gems/github_status_notifier)
* [env_pull_request](https://rubygems.org/gems/env_pull_request)
* [restore_bundled_with](https://rubygems.org/gems/restore_bundled_with)
* [git_httpsable-push](https://rubygems.org/gems/git_httpsable-push)
* [pull_request-create](https://rubygems.org/gems/pull_request-create)
* [cron_for_github](https://rubygems.org/gems/cron_for_github)
* [git_diff_parser](https://rubygems.org/gems/git_diff_parser)


## [compare_linker](https://rubygems.org/gems/https://rubygems.org/gems/compare_linker)

最近のupdate as a serviceならだいたい持ってる、github上のdiffにリンク貼ったコメントを付けてくれるgem

webサービスなら同時にやってくれる方がいいかもだけど、
ライブラリならtachikomaに内蔵するより、別コマンドの方が良い
あと、github api依存の部分を外した compare-linker-wrapperと`bin/compare-linker.sh`。あとsaddlerも使っている。
compare-linker-wrapperで出力して、saddlerでpull requestのコメントに載せている。


```bash
#!/usr/bin/env bash
set -ev

if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
  # gem prepare
  gem install --no-document saddler saddler-reporter-github \
  compare_linker_wrapper text_to_checkstyle github_status_notifier

  github-status-notifier notify --state pending --context saddler/compare_linker

  git diff --name-only origin/master \
   | grep ".*[gG]emfile.lock$" || RETURN_CODE=$?

  case "$RETURN_CODE" in
   "" ) echo "found" ;;
   "1" )
     echo "not found"
     github-status-notifier notify --state success --context saddler/compare_linker
     exit 0 ;;
   * )
     echo "Error"
     github-status-notifier notify --state failure --context saddler/compare_linker
     exit $RETURN_CODE ;;
  esac

  git diff --name-only origin/master \
   | grep ".*[gG]emfile.lock$" \
   | xargs compare-linker-wrapper --base origin/master \
      --formatter CompareLinker::Formatter::Markdown \
   | text-to-checkstyle \
   | saddler report \
      --require saddler/reporter/github \
      --reporter Saddler::Reporter::Github::PullRequestComment

  github-status-notifier notify --state success --context saddler/compare_linker
fi

exit 0
```

ruby版 あとでかく; for Ruby TBD

If you don't want to add tools to app's dependency, it's ok with `bundle-update/Gemfile` or `compare-linker/Gemfile`.
(I don't try this yet.)
And this dependencies (bundle-update/Gemfile.lock) can `bundle update` regularly.
(If you write so.)

アプリの依存に載せたくないばあいも、`bundle-update/Gemfile`や`compare-linker/Gemfile`にしておけばいいんじゃないですかね(試してない)
なお、そうするとこっちの依存部分についても、定期的にbundle updateできる。
(ように自分で書けば良い)


## npm-check-updates

tachikoma gem uses `david`, but I feel better about npm-check-updates.
Recently, npm-check-updates becomes a bit fragile... (e.g. they got `bower update`)

tachikomaはdavid使ってるけど、npm-check-updatesの方が筋がいい。
最近微妙だけど…
bower-update とりこんじゃったり。+1と-1で荒れて、取り外されてめでたし。


## Problems

課題

Sometimes a execution regularly fails during `gem install`.
I recommend `travis_retry gem install xxx`. (If you run this on travis-ci.)

gem installがコケて定期実行に失敗することがあるらしい
travis_retry gem install xxx とすればよいのでは(travisなら)


tachikoma gemは発展的解消できたな
でも、コレ設定メンドイな…わかってる自分でやるのもメンドイぐらいなので、他の人
はできないな
やっぱtachikoma.io便利だな

## 余談

### パイプ最高期

shell scriptなら言語中立にいけるやん! パイプ最高や!期にノッて書いたライブラリ群

あれ、shell scriptって環境依存激しいし微妙に方言が有る
windows? なにそれうまいの?
windowsユーザー多いし、どうせなら多くの人に使ってもらいたい。

### saddler toolchain

このツールチェーンでは、C extensionを使わない。nokogiri, ruggedを避ける
標準モジュールを使う
nokogiriではなくrexml
ビルドするの大変になる& JRubyなどでもいけるように rugged使わなかったけど、それではwindowsで動かないので。。。

### golangやりたい(やってない)期

golangで書き換えたいからgolangの勉強はじめようかな うーん n度目のgolangやりたい期
golangだとインストールがcurlとかになるのでそれはそれでどうなのよ


おわり


<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151210-tachikoma-next%2F&t=Tachikoma%20next" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20151210-tachikoma-next
