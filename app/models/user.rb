class User < ApplicationRecord

  REGEX =  /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  has_many :posts, dependent: :destroy

  validate :name, presence: true, length: {maximum: 50}
  validate :email, presence: true, length: {maximum: 255}, format: { with: REGEX },
           uniqueness: { case_sensitive: false }

  has_secure_password
  validate :password, presence: true, length: {minimum: 6}
end
