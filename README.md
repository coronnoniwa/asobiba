# アプリケーション名
asobiba

# アプリケーション概要
このアプリは、さまざまなスポーツやインドアアクティビティを楽しみたい人をつなげるプラットフォームです。ユーザーは自分の興味に合った施設やアクティビティを検索し、新しい出会いや交流を楽しむことができます。アプリ内では、チャットルームを作成し、参加者と共にアクティビティを計画することができます。

# URL
http://18.204.31.60/

# テスト用アカウント
  Basic認証パスワード：2222
  
  Basic認証ID：admin
  
  メールアドレス：test@test
  
  パスワード：111aaa

# 利用方法
## 施設登録
  1.トップページ（施設一覧ページ）からユーザーの新規登録を行います
  
  2.施設登録ボタン(ヘッダーのNew施設ボタン)から、施設の内容（施設の画像、施設名、施設の説明、施設の場所、施設のリンク、場所のリンク）を入力し投稿します
## asobiba登録
  1.登録済みの施設の詳細ページに遷移します
  
  2.asobiba作成ボタンからasobiba名、種目を選択し、asobibaを登録します
## メッセージ投稿
  1.asobiba一覧、または施設詳細ページからasobibaに参加します
  
  2.下部のメッセージ入力欄からメッセージ、画像を投稿します
# アプリケーションを作成した背景
  九州から上京した頃の自分を思い出し、多くの施設はあるけど、知り合いがいない中一緒に遊べる人がいませんでした。
  
  そんなときに特定の施設で一緒に遊べる人を探せるアプリがないかと思い作成しました。

# 洗い出した要件
![F49BF137-6C56-46D8-9008-243E44BF7CB2](https://github.com/coronnoniwa/asobiba/assets/121328655/a03f1403-bfe7-402f-944c-086c6c68e11f)


# 実装した機能についての画像やGIFおよびその説明
## トップページ

https://github.com/coronnoniwa/asobiba/assets/121328655/537d7297-c08c-4852-9e02-73f3e992eb88

## 施設投稿機能

https://github.com/coronnoniwa/asobiba/assets/121328655/9455b363-9ca7-4c7f-b4b2-9c3b3869f29d

## 施設詳細ページ

https://github.com/coronnoniwa/asobiba/assets/121328655/797e44c0-9601-4acb-9d08-02c14bcc2353

## asobiba作成機能

https://github.com/coronnoniwa/asobiba/assets/121328655/80540ce2-573a-4474-bbe5-a4f552cb92de

## メッセージ投稿機能

https://github.com/coronnoniwa/asobiba/assets/121328655/be3b9dd4-bd85-4b66-b13d-5c72dbf2bd6f

# 実装予定の機能
  ・施設一覧のasobiba数表示機能
  
  ・asobiba一覧のメッセージ数表示機能
  
  ・ユーザー情報、施設、asobibaの編集、削除機能
  
  ・asobibaへの参加者制限機能
  
  ・参加費の集金機能
  
  ・Googleマップの表示機能
  
  ・施設、asobiba検索機能

# データベース設計
![B569D4DF-213C-4F30-ADDF-42CBD879CC09](https://github.com/coronnoniwa/asobiba/assets/121328655/13d72727-98c3-4ac5-b6a1-e281cdda0a73)

# 画面遷移図
![371B840E-302A-464B-9840-CCB15489D87F](https://github.com/coronnoniwa/asobiba/assets/121328655/78758190-55b2-42e1-8556-cf32047c0d53)

# 開発環境
  Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行してください。

  % git clone http://github.com/coronnoniwa/asobiba
  
  % cd asobiba
  
  % bundle install
  
  % yarn install

# 工夫したポイント
## 見て飽きないデザイン
  ・ウィンドウのサイズが変わってもレイアウトが崩れないようにしました。
  
  ・asobiba一覧ページでは、色々な人が遊んでいるのをイメージして、参加するボタンをそれぞれのasobibaで違う色にしました。
  
  ・施設の写真は左側を丸く削ることで、ページに馴染みやすいようにしました。
  
  ・広告はユーザーの邪魔にならない位置に配置し、操作しやすいようにしました。
  
  ・配色も心掛け、黄緑を基調としたデザインにしました。

## わかりやすいデザイン
  ・トップページでどんなアプリなのかすぐわかるようにデザインしました。
  
  ・わかりやすい３ステップで操作方法を書きました。
  
  ・asobibaでは他人の投稿は左に、自分の投稿は右に表示されるようにしました。

## 操作性の向上
  ・画面をみてすぐどのように操作するかわかるように、ボタンを大きくしたり、色を付けるなどしました。

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
