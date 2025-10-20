class Post < ApplicationRecord
  # Bir gönderi tek bir 'User'a aittir.
  belongs_to :user
  
  # Bir gönderi tek bir 'Category'ye aittir.
  belongs_to :category
  
  # Bir gönderide birden çok 'Comment' olabilir.
  has_many :comments, dependent: :destroy 
  
  # Bir gönderi birden çok 'Tag'a sahip olabilir (N:M).
  has_and_belongs_to_many :tags
end