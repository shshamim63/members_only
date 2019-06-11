class Post < ApplicationRecord
  belongs_to :user

  validate :title, presence: true, length: {maximum: 85}
  validate :body, presence: true, length: {maximum: 285}
  validate :user_id, presence: true
end
