class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 60 }, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end