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

## Setup

```
bundle install
bin/rails db:setup
bin/rails server
```

## 勉強用アプリ

### 映画館の予約システム

#### できること
- ユーザー
  - 映画館の予約
  - 自由席の選択
  - 疑似決済
  - 予約完了のメール
  - カレンダーごとの上映スケジュール一覧確認
- 管理者
  - 上映映画の登録
  - 購入者の一覧確認