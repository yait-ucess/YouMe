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

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- belongs_to :profile, dependent: :destroy


## profilesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| easy_history     | text       | null: false       |
| my_history       | text       | null: false       |
| my_store         | text       | null: false       |
| user_id          | references | foreign_key: true |

### Association

- belongs_to :user, dependent: :destroy
- has_many   :article, dependent: :destroy


## articlesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| title            | string     | null: false       |
| text             | text       | null: false       |
| profile_id       | references | foreign_key: true |

