class Article < ActiveRecord::Base
  # This stops articles with nil values, and sets minimum and maximum length.
  validates :title, presence: true, length: { minimum: 3, maximum: 10 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 300} 
end
