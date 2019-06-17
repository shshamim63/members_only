class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 85}
  validates :body, presence: true, length: {maximum: 285}
  validates :user_id, presence: true
end
