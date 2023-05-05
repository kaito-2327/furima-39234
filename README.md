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

## users テーブル

| Column              | Type     | Options                   |
| ------------------- | -------- | ------------------------  |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| nickname            | string   | null: false               |
| first_name          | string   | null: false               |
| last_name           | string   | null: false               |
| first_kana          | string   | null: false               |
| last_kana           | string   | null: false               |
| birthday            | date     | null: false               |

has_many　items テーブル
has_many　buys テーブル

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false,                   | 商品名
| price          | integer    | null: false,                   | 価格
| explan         | text       | null: false,                   | 商品の説明
| category_id    | integer    | null: false,                   | カテゴリー
| situation_id   | integer    | null: false,                   | 状態
| charge_id      | integer    | null: false,                   | 配送料の負担
| prefectures_id | integer    | null: false,                   | 地域
| day_id         | integer    | null: false,                   | 日数
| user           | references | null: false, foreign_key: true | 

be_longs_to　users テーブル
has_many　   buys テーブル
has_many   　delivery テーブル

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true | 
| item      | references | null: false, foreign_key: true | 

has_many　   items テーブル
be_longs_to　users テーブル
be_longs_to　delivery テーブル

## delivery テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false,                   | 郵便番号
| prefectures_id | integer    | null: false,                   | 地域
| municipality   | string     | null: false,                   | 市町村
| address        | string     | null: false,                   | 番地
| bldg           | string     |                                | 建物
| phone          | string     | null: false,                   | 電話
| buy            | references | null: false, foreign_key: true | 購入履歴
 
has_one　users テーブル
be_longs_to　delivery テーブル