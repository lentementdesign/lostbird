# README

# 鳥専用迷子掲示板サービス「ロストバード(仮)」
## 概要
ロストバードで迷子になってしまった、大切なペットを探そう。										
自分のペットかどうか必要な情報が場所別などに検索することができます。										
このロストバーズは鳥を迷子にしてしまったことのある開発者が、										
ペットの迷子という悲しい事件を世の中から減らすために作成したサービスです。										

## コンセプト
導線整理で迷子を素早く解決

## バージョン
Rails 5.2.4.4
ruby 2.6.5

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、ニックネーム、パスワードは必須
- [ ] ペット一覧表示機能
- [ ] ペット投稿機能
  - [ ] 性別、ペットの特徴、写真、迷子かどうか、受付中なのかは必須
- [ ] ペット編集機能
- [ ] ペット削除機能
  - [ ] ペット編集とペット削除は投稿者のみ実行可能
- [ ] メッセージ投稿機能
- [ ] メッセージ削除機能
- [ ] メッセージ編集機能
  - [ ] メッセージ編集とメッセージ削除はコメントした本人のみ可能

## カタログ設計
https://docs.google.com/spreadsheets/d/1m_6SRfUgCCA5SH8dm_nzWa8D0tTBt7T0K1p8hINppI8/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1m_6SRfUgCCA5SH8dm_nzWa8D0tTBt7T0K1p8hINppI8/edit#gid=968924647

## 画面遷移図
https://docs.google.com/spreadsheets/d/1m_6SRfUgCCA5SH8dm_nzWa8D0tTBt7T0K1p8hINppI8/edit#gid=1328897420

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1m_6SRfUgCCA5SH8dm_nzWa8D0tTBt7T0K1p8hINppI8/edit#gid=1018573718

## 使用予定Gem
* carrierwave
* mini_magick
* devise

## 仕様予定技術
devise、メッセージ機能、Vue.js
