# kaketa
- 日記、小説など文章の創作を公表するSNSです
# 概要
- 日記、小説、詩等、明朝体＋縦書きで創作物をアップできるSNS
- 気に入った投稿にはいいねができる
- 個々の投稿にコメントができる
- タグを付けて投稿、検索ができる
- 気が合う創作仲間でコミュニティーが作れる
# 本番環境
・URL
- https://kaketa.herokuapp.com/
- テストアカウント
- ユーザー名：tes
- パスワード：1111111k
# 製作意図
- 自分の文章を好きになれるように、文章が映えるレイアウトでSNSを作りたかった
- 色数を減らし、白背景に黒の文字が映えるよう配色した(白、黒、赤のみ)
- 明朝体で、文庫本を開いた時のような感覚で読めるようにしたかった
![276794e3429d215d1a091559ea923be5](https://user-images.githubusercontent.com/67635291/93159850-1f1f3180-f74a-11ea-8de0-70877fa55d13.png)
# kaketa DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
has_many :likes
has_many :posts, through :likes
has_many :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|string|null: false, foreign_key: true|
|like_id|string|foreign_key: true|
|tag_id|string|foreign_key: true|
### Association
has_many :likes
has_many :users, through :likes
has_many :posts_tags
has_many :tags , through :posts_tags
belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|post_id|string|null: false, foreign_key: true|
### Association
belongs_to :post
belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
|text|text||
