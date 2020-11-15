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
| day         | references | null: false, foreign_key: true |

### Association

- belongs_to :day
- belongs_to :user

### アプリ名						
- DayLog
### 概要						
- ToDoリストの作成と日記投稿
### 本番環境(デプロイ先　テストアカウント＆ID)				
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
### 課題や今後実装したい機能						
- ビューのスマホ対応が未完成なので完成させる
- コメント機能をつけて自分の日記に追記できる様にする