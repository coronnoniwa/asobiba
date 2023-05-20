# アプリケーション名
asobiba

# アプリケーション概要
このアプリは、さまざまなスポーツやインドアアクティビティを楽しみたい人をつなげるプラットフォームです。ユーザーは自分の興味に合った施設やアクティビティを検索し、新しい出会いや交流を楽しむことができます。アプリ内では、チャットルームを作成し、参加者と共にアクティビティを計画することができます。

# URL
(ここにURLを記載)

# テスト用アカウント
Basic認証パスワード：2222
Basic認証ID：admin
メールアドレス：test@test
パスワード：111aaa

# 利用方法
## 施設登録
  1.トップページ（施設一覧ページ）からユーザーの新規登録を行う
  2.施設登録ボタン(ヘッダーのNew施設ボタン)から、施設の内容（施設の画像、施設名、施設の説明、施設の場所、施設のリンク、場所のリンク）を入力し投稿する
## asobiba登録
  1.登録済みの施設の詳細ページに遷移する
  2.asobiba作成ボタンからasobiba名、種目を選択し、asobibaを登録する
## メッセージ投稿
  1.asobiba一覧、または施設詳細ページからasobibaに参加する
  2.下部のメッセージ入力欄からメッセージ、画像を投稿する

# アプリケーションを作成した背景
九州から上京した頃の自分を思い出し、地元より多くの施設はあるが、

# 洗い出した要件
(ここに洗い出した要件を記載)

# 実装した機能についての画像やGIFおよびその説明
(ここに実装した機能の画像やGIF、説明を記載)

# 実装予定の機能
(ここに実装予定の機能を記載)

# データベース設計
(ここにデータベース設計を記載)

# 画面遷移図
(ここに画面遷移図を記載)

# 開発環境
(ここに開発環境を記載)

# ローカルでの動作方法
(ここにローカルでの動作方法を記載)

# 工夫したポイント
(ここに工夫したポイントを記載)

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :rooms, through: :room_users
- has_many :room_users
- has_many :messages
- has_many :facilities

## facilitiesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     |                                |
| facility_link | string     |                                |
| place_link    | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :rooms

## roomsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| event       | integer    | null: false                    |
| facility    | references | null: false, foreign_key: true |

### Association

- belongs_to :facility
- has_many :users, through: :room_users
- has_many :room_users
- has_many :messages

## room_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## messagesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content| text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
