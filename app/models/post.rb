class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text, :copy, :user_id, presence: true
end
