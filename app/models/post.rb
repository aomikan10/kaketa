class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text, :copy, :user_id, presence: true
  has_many :likes
  has_many :user_likes, through :likes
end
