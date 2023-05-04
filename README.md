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

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------  |
| email       | string | null: false, unique: true |
| password    | string | null: false, unique: true |
| name        | string | null: false, unique: true |
| first_name  | text   | null: false               |
| last_name   | text   | null: false               |
| birthday    | text   | null: false               |
| delivery    | text   | null: false               |
| bay         | text   | null: false               |
| item        | text   | null: false               |

## items テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| title      | text       | null: false,                   |
| date       | text       | null: false,                   |
| category   | references | null: false, foreign_key: true |
| situation  | text       | null: false, foreign_key: true |
| price      | text       | null: false,                   |
| user       | references | null: false, foreign_key: true |

## buy テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| delivery  | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## delivery テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| address   | text       | null: false, unique: true      |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |