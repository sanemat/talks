---
pagetitle: Environmental Variable Programming
css:
  - github-markdown.css
  - page.css
  - http://fonts.googleapis.com/css?family=Lato
canonical: http://sanemat.github.io/talks/20151208-environmental-variable-programming/
lang: ja
description: env_branch and env_pull_request - Environmental Variable Programming
---
<script type="text/javascript">
  window.analytics=window.analytics||[],window.analytics.methods=["identify","group","track","page","pageview","alias","ready","on","once","off","trackLink","trackForm","trackClick","trackSubmit"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var key=window.analytics.methods[i];window.analytics[key]=window.analytics.factory(key)}window.analytics.load=function(t){if(!document.getElementById("analytics-js")){var a=document.createElement("script");a.type="text/javascript",a.id="analytics-js",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.io/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)}},window.analytics.SNIPPET_VERSION="2.0.9",
  window.analytics.load("ig7q6np7c1");
  window.analytics.page();
</script>

# Environmental Variable Programming

環境変数プログラミング

sanemat {AT} tachikoma.io


## Examples

環境変数を取得してプログラミングする必要が有ることがある

* リポジトリにpushしたくないデータ
    * GitHubのaccess tokenなど
* 環境固有のデータ
    * RAILS_ENVなど
    * CI環境など

```ruby
# リポジトリにpushしたくないデータ
token = ENV['GITHUB_ACCESS_TOKEN']

# 環境固有のデータ
if ENV['SOME_VAR'].downcase == 'true'
  # your code
end
```

今回は、環境固有のデータ、特にCI環境の話をする。`dotenv`などの話はしない。

CI環境固有のデータは、build周りのツールや、デプロイ周りのツールで必要となる。
この中で出会った興味深いこと、作ったツールの話をする。


## CIでの環境変数の扱い

### [Environment Variables - Travis CI](http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables)

```text
CI=true
TRAVIS=true
CONTINUOUS_INTEGRATION=true
DEBIAN_FRONTEND=noninteractive
HAS_JOSH_K_SEAL_OF_APPROVAL=true
USER=travis (do not depend on this value)
HOME=/home/travis (do not depend on this value)
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
RAILS_ENV=test
RACK_ENV=test
MERB_ENV=test
```

### [Environment variables - CircleCI](https://circleci.com/docs/environment-variables#build-details)

```
CIRCLECI=true
CI=true
CIRCLE_PROJECT_USERNAME=foo
  The username or organization name of the project being tested,
  i.e. "foo" in circleci.com/gh/foo/bar/123
CIRCLE_PROJECT_REPONAME=bar
  The repository name of the project being tested,
  i.e. "bar" in circleci.com/gh/foo/bar/123
CIRCLE_BRANCH=master
  The name of the branch being tested, e.g. 'master'.
```

いろんな環境変数

CI環境によって違う

特にルールはない(と思う)
あるのかも?
ちょっと後で聞いてみたいけど

結構なんとなく似通ったいろいろ
`CI=true`など。ツールによっては、CI=trueだとカバレッジをcoverallsに送る、など。


## なんとなく感じ取ったルール

### truthyのとき

* 何か文字列が入る

### falseyのとき

* 環境変数のkey自体がなくなるパターン
* 環境変数のvalueが空文字列のパターン


## 問題

### あるある1

結構こういう、このキーである、という情報はどうにか有るのだが、
こういう値を取りうる、という記述が欠けていることが多い。

しかも、これがCI環境間で統一されていない。
さらに、同じCI環境内でも、keyによって違う。


### あるある2

ruby固有のメンドイこととしては、
CI環境的には空文字列はfalseyだけど、Ruby的には空文字列はtruethy


### あるある3

travis-ci決め打ちで作って、circle-ciで使いたくなる
よくある


### あるある4

テストでいちいち考えなくちゃいけないことが増える
pull requestやテスト自体がCI環境上で動くので。
環境変数消し漏れたり、戻し漏れたり、で動かないはずのものが動く分岐の方に行ってしまったり。


## [env_branch](https://github.com/packsaddle/ruby-env_branch)

branch情報を取り出したいことがよくあって、環境変数から取り出す部分をgemに切り出した。


### Usage

```ruby
require 'env_branch'

env_branch = EnvBranch.new
env_branch.branch? #=> true
env_branch.branch_name #=> 'your-branch-name'
```

### Question

branch名ってgitコマンドで取れるのでは?
CI環境によって違う

Travis-CIだと、環境変数から取るのが良い

checkout

なので、git branchしてもbranch名はいない


### helper

```ruby
require 'env_branch/test_helper'

class TestExample < Test::Unit::TestCase
  extend ::EnvBranch::TestHelper

  def self.startup
    stash_env_branch
  end

  def self.shutdown
    restore_env_branch
  end
end
```

各CI環境でのbranchに関する環境変数を、いったん退避して、最後書き戻す。便利。


## [env_pull_request](https://github.com/packsaddle/ruby-env_pull_request)

pull request idを取り出したい。
`https://github.com/sanemat/node-boolify-string/pull/16`だとしたら、'16'これ。
pull requestだった場合、ここに数字が入る。
GitHubのpull requestに対してhookなりで何かをしたい場合、これを使ってリクエストする必要がある。

pull_request番号を取り出したいことがよくあって、環境変数から取り出す部分をgemに切り出した。

```ruby
require 'env_pull_request'

env_pull = EnvPullRequest.new
env_pull.pull_request? #=> true
env_pull.pull_request_id #=> 800
```

```ruby
require 'env_pull_request/test_helper'

class TestExample < Test::Unit::TestCase
  extend ::EnvPullRequest::TestHelper

  def self.startup
    stash_env_pull_request
  end

  def self.shutdown
    restore_env_pull_request
  end
end
```

便利なので使ってください

## 対応しているCI環境

* env_branch
    * Travis-ci
    * CircleCI
* env_pull_request
    * Travis-ci
    * CircleCI
    * Jenkins GitHub pull request builder plugin


## 余談

### pull requestでない場合

falseyの場合、環境変数のkey自体がない場合と、valueが空文字列の場合があるといった。

引用

> TRAVIS_PULL_REQUEST: The pull request number if the current job is a pull request,
> “false” if it’s not a pull request.

!???

CI環境の環境変数、基本的には

* truthyのとき
    * 何か文字列が入る
* falseyのとき
    * 環境変数のkey自体がなくなるパターン
    * 環境変数のvalueが空文字列のパターン
    * 環境変数のvalueが"false"のパターン


そういうのにもenv_branchやenv_pull_requestは対応済みです。
なのでぜひ使って。
その他ci環境はpull requestください。droneやwerckerなど。
使う人が対応しようってことで。


楽しい環境変数プログラミングを。



<iframe src="http://expando.github.io/add/?u=http%3A%2F%2Fsanemat.github.io%2Ftalks%2F20151208-environmental-variable-programming%2F&t=env_branch%20and%20env_pull_request%20-%20Environmental%20Variable%20Programming" frameborder=0 frametransparency=1 scrolling=no height=30 width=300>
</iframe>

[tachikoma-io]:http://tachikoma.io/?utm_source=talk&utm_medium=slide&utm_campaign=20151208-environmental-variable-programming
