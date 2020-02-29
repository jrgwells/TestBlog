class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has many :articles, through: :article_categories
  # before_save { self.email = email.downcase }
  # This stops articles with nil values, and sets minimum and maximum length.
  validates :title, presence: true, length: { minimum: 3, maximum: 100 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 300} 
  validates :user_id, presence: true
end
