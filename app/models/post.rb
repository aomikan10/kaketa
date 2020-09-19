class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text, :copy, :user_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  acts_as_taggable

end
