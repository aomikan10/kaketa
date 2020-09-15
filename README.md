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
