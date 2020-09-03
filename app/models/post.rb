class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text, :copy, :user_id, presence: true
  has_many :likes
  has_many :like_users, through: :likes, source: :user

end
