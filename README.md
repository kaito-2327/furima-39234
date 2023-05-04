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

| Column      | Type     | Options                   |
| ----------- | -------- | ------------------------  |
| email       | string   | null: false, unique: true |
| password    | string   | null: false               |
| nickname    | string   | null: false               |
| first_name  | text     | null: false               |
| last_name   | text     | null: false               |
| first_kana  | text     | null: false               |
| last_kana   | text     | null: false               |
| birthday    | datetime | null: false               |

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false,                   |
| price     | integer    | null: false,                   |
| date      | text       | null: false,                   |
| category  | integer    | null: false,                   |
| situation | integer    | null: false,                   |
| charge    | integer    | null: false,                   |
| sender    | integer    | null: false,                   |
| day       | integer    | null: false,                   |
| user      | references | null: false, foreign_key: true |

## buy テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## delivery テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false,                   |
| prefectures  | 整数型      | null: false,                   |
| municipality | string     | null: false,                   |
| address      | string     | null: false,                   |
| bldg         | string     | null: false,                   |
| phone        | string     | null: false,                   |
| buy          | references | null: false, foreign_key: true |
