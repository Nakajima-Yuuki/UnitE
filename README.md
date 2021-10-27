# README

## 「UnitE」概要

**コーディネートに悩む方達のファッション参考サイト**

UnitE は、ファッションを楽しみたい方のコーディネート参考サイト。<br>
お洒落はしたいけど上手くコーディネートが出来ない<br>
自分にはファッションセンスがなく、毎日着る服に悩む事が多い<br>
ファッション雑誌を買うほど、服には興味がないし、ネットで参考になるサイトはないか...、<br>
そんな悩みを抱えてる方々に毎日のコーディネートのヒントとなるように<br>
スタイリストやショップ店員が皆さんのお手本となるファッションを見つける事が出来るアプリです。

## 💁作成背景
既にコーディネート投稿アプリは存在しますが、全ユーザーが投稿出来てしまい自分の試したい<br>
コーディネート写真を見つけるのが大変です。ただ服が好きという人でも投稿が出来てしまうので、<br>
プロフェッショナルな方々のコーディネートだけを見たいと思う方も多いと思ったからです。<br>
なのでコーディネートを投稿できるのは、アパレル店員やスタイリストやファッションブランドの企業として
コーディネート参考サイトの質を高めたいと思い開発しました。


## 🖥開発言語
- Ruby2.6.5
- Rails5.2.5
- jQuery

## 📖機能一覧
* ユーザー
  *新規登録・ログイン機能
  * コーディネートの検索
  * コーディネートお気に入り
  * コーディネート評価機能
* ファッショニスタ
  * 新規登録機能・ログイン機能
  * コーディネートの登録(CRUD) (写真投稿)
* アドミン(サイト管理者)
  * 不正な利用者の投稿を編集・削除(CRUD)

## 📝使用Gemなど一覧
*ログイン機能&日本語化
  * gem 'devise'
  * gem 'devise-i18n'
  * gem 'devise-i18n-views'
  *gem 'rails-i18n'

* 写真機能
  * gem 'mini_magick'  
  * gem 'image_processing', '~> 1.2'
  * gem "aws-sdk-s3", require: false
  * gem 'dotenv-rails'

*ページネーション
  * gem 'kaminari'

*Webをリッチにする為のgem
  * gem 'font-awesome-sass'

*検索機能
  * gem 'ransack'

*管理者権限
  * gem 'cancancan'
  * gem 'rails_admin'

*seedデータ
  * gem 'faker'

## 実行手順
```
$ git clone git@github.com:Nakajima-Yuuki/UnitE.git
$ cd unite_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

## カタログ設計
https://docs.google.com/spreadsheets/d/1GGoerUN93dBiL2jFIBhhqVc13BB4XjfVYSdN1UBFENg/edit#gid=0

## テーブル定義書
https://docs.google.com/spreadsheets/d/1GGoerUN93dBiL2jFIBhhqVc13BB4XjfVYSdN1UBFENg/edit#gid=108161797

## ワイヤーフレーム
https://cacoo.com/diagrams/phS3RYTTh4sINLt7/44B59

## ER図
![ER1](https://user-images.githubusercontent.com/85724781/135054185-5bbd31c5-9120-4c83-a2d9-4eced6bdcb7f.png)

## 画面遷移図
https://drive.google.com/file/d/1a2_U5aDpvxY-XZbWEyZRyS-_7tzj4rPx/view?usp=sharing
![画面遷移図](https://user-images.githubusercontent.com/85724781/134872658-682d271c-1aec-4fba-b7fb-c64f931d0be3.png)
