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
| today         | string     | null: false                    |
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
