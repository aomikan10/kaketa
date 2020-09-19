# kaketa
- 日記、小説など文章の創作を公表するSNSです
# 概要
- 日記、小説、詩等、明朝体＋縦書きで創作物をアップできるSNS
- 気に入った投稿にはいいねができる
- 個々の投稿にコメントができる
- タグを付けて投稿、検索ができる
- 気が合う創作仲間でコミュニティーが作れる
# 本番環境
### URL
- https://kaketa.herokuapp.com/
### テストアカウント
- メールアドレス：aaaa@gmail.com
- パスワード：1111111k
# 製作意図
- 自分の文章を好きになれるように、文章が映えるレイアウトでSNSを作りたかった
- 色数を減らし、白背景に黒の文字が映えるよう配色した(白、黒、赤のみ)
- 明朝体で、文庫本を開いた時のような感覚で読めるようにしたかった
![276794e3429d215d1a091559ea923be5](https://user-images.githubusercontent.com/67635291/93159850-1f1f3180-f74a-11ea-8de0-70877fa55d13.png)
# 主な使用技術
- ruby
- ruby on rails
- Haml
- scss
- jquery
- heroku
# 実装したい機能、今後の課題
- タグ機能の完成
- DM機能
- ユーザーをお気に入りできる機能
- コミュニティ(グループ機能)の追加
# kaketa DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :likes
- has_many :posts, through :likes
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|string|null: false, foreign_key: true|
|like_id|string|foreign_key: true|
|tag_id|string|foreign_key: true|
### Association
- has_many :likes
- has_many :users, through :likes
- has_many :posts_tags
- has_many :tags , through :posts_tags
- belongs_to :user
- acts_as_taggable

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|post_id|string|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
|text|text||
### Association
- belongs_to :post
- belongs_to :user

# tagsテーブル
※acts-as-taggable-onにより生成。

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, foreign_key: true, unique: true|
|taggings_count|integer| |

### Association
- belongs_to :tagging

# taggingsテーブル
※acts-as-taggable-onにより生成。

|Column|Type|Options|
|------|----|-------|
|tag_id|integer|foreign_key: true|
|taggable_type|text|null: false|
|taggable_id|integer|foreign_key: true|

### Assosiation
- has_many :tags