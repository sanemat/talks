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


## Bundle update regularly, frequently

### 2013-05-31 - Kensuke Nagae @kyanny

[Continuous gem dependency updating with Jenkins and Pull Request](https://speakerdeck.com/kyanny/continuous-gem-dependency-updating-with-jenkins-and-pull-request)

### 2013-06-23 - Kenichi Murahashi @sanemat

[Tachikoma gem first version v2.0.0 (not published)](https://rubygems.org/gems/tachikoma) [commit](https://github.com/sanemat/tachikoma/commit/a813fc718d43139820d36a20dfd8595958f6b4e8)

### 2014-09-17 - Kenichi Murahashi @sanemat

[When was the build passing? / Travis CI Meetup 2014-09-17](http://sanemat.github.io/talks/20140917-travis-ci-meetup-tachikoma-io/)

## Motivation

* shell scriptで書くのがそもそもツライ
* ほぼ同じスクリプトがプロジェクトごとに散らばるのでツライ

## Tachikoma gem

### pros

* yamlの設定を置くと、gemとコマンドラインで完結する

### cons

* カスタマイズ性低い
* 実行環境は自分で作成する必要がある
* 設計思想として、自前jenkinsで動かすのを第一に考えていた
    * CI as a web serviceの発展


## tachikoma.io

### pros

* github oAuthで連携, toggle一発
* .tachikoma.ymlで設定

### cons

* リポジトリの読み書き権限もらうのが非常に苦戦
* public版も、ユーザー権限でpush出来るようにするものはあるが、300+のユーザー中利用者1(自分のみ)
* ユーザー権限でpushできると、botのcommitの上に自分のコミット詰めるので、すごい便利なのだが…
* カスタマイズ性低い


## 揺り戻し

* shell scriptやruby scriptで書けばいいじゃん

しかし

やっぱりつらい

shell script or Ruby scriptで書くの何がツライのか
直にOctokit使えばいいだけなのわかるけど、いちいちAPI調べてとかダルい


## 対象を絞ってより使いやすくするアプローチ

### Ruby gemの場合

* https://www.deppbot.com/
* circleci-bundle-update-pr
* ci-bundle-update

### Node.js npmの場合
* http://greenkeeper.io/


## ここから知見 + 私見 + 主張

カスタマイズ欲求がプロジェクト・プロダクトの特性によって無限に出てくる(はず)

* mongodb使いたい
* mecab使いたい
* 頻度は平日の朝に来て欲しい
* プロジェクト構成が、トップレベルにRubyやRails来てない
* 複数Rubyプロジェクトが入っている
* Node.js npmもやりたい


これは、travis-ci, CircleCIを再発明することになるのでは??

CI nativeのアプリケーションへ

CI上で動けばいいじゃん


### 先回り では、bundle update as a serviceは不要?

では、tachikoma.ioやdeppbotは不要なのか? tachikoma.io止めちゃうの?

やっぱり、スクリプト書くのめんどい…
設定メンドイな…わかってる自分でやるのもメンドイぐらいなので、他の人はたぶんできないな
やっぱtachikoma.io便利だな

自分には必要!

### 結論

`bin/bundle-update.sh`あるいは`bin/bundle-update.rb`を[Cron for GitHub](http://packsaddle.org/articles/cron-for-github-app-overview/) あるいは[AWS Lambda Scheduled Event](https://docs.aws.amazon.com/lambda/latest/dg/with-scheduled-events.html)でkickする。

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

あとでかく

`bundle-udpate/Gemfile`

```ruby
```

`bundle-udpate/bin/bundle-update.rb`

```ruby
```

`cd bundle-update && bundle exec bin/bundle-update.rb && cd ..`


#### Example

[sanemat/ruby-example-rails-banana](https://github.com/sanemat/ruby-example-rails-banana)


## compare-linker

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

ruby版 あとでかく

アプリの依存に載せたくないばあいも、`bundle-update/Gemfile`や`compare-linker/Gemfile`にしておけばいいんじゃないですかね(試してない)
なお、そうするとこっちの依存部分についても、定期的にbundle updateできる。
(ように自分で書けば良い)


## npm-check-updates

tachikomaはdavid使ってるけど、npm-check-updatesの方が筋がいい。
最近微妙だけど…
bower-update とりこんじゃったり。+1と-1で荒れて、取り外されてめでたし。


## 課題

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


<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151210-tachikoma-next%2F&t=Saddler%20-%20better%20pronto%20%2F%20Shibuya.rb" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20151210-tachikoma-next
