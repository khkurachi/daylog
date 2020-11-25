# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

### アプリ名						
- DayLog
### 概要						
- ToDoリストの作成と日記投稿
### 本番環境(デプロイ先 テストアカウント＆ID)				
- https://daylog-30481.herokuapp.com/
- testログイン用メールアドレス test@test
- testログイン用パスワード test46
### 制作背景(意図)						
- 意志の弱い人やサボり癖のある人が使い続けやすいアプリが無いと考えた事
### 工夫したポイント						
- 削除機能や編集機能を実装しない事で適当な内容を日記に投稿できない様に心理的障壁をかけた事
- カレンダー検索の機能を実装した事
### 使用技術(開発環境)						
- Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code
### アプリ使用 参考Gyazo
- トップページからToDoリスト投稿画面までhttps://gyazo.com/0b5faca53e7e82710ed1d82220f62e2a
- 新規投稿からトップページへ戻るまでhttps://gyazo.com/60af4c6998953b292042e4cf329a7def
- トップページから詳細画面、日記の投稿画面までhttps://gyazo.com/359b45688789145e928b655aef9eaadb
- 日記投稿から詳細ページへ移動、日記投稿のボタンが消えていることの確認までhttps://gyazo.com/6f834b8be78914f843137c020f5e75e7
- カレンダー検索機能https://gyazo.com/95c8f0378614f7b8cff2e05f04df0f84
## users テーブル
| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
### Association
- has_many :days
- has_many :comments

## days テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| want_do       | string     | null: false                    |
| must_do       | string     | null: false                    |
| idea          | string     | null: false                    |
| today_point   | integer    | null: false                    |
| happy         | string     | null: false                    |
| sad           | string     | null: false                    |
| effort        | string     | null: false                    |
| could_not     | string     |                                |
| learn         | string     | null: false                    |
| impression    | text       | null: false                    |
### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| day         | references | null: false, foreign_key: true |

### Association

- belongs_to :day
- belongs_to :user

