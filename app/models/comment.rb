class Comment < ApplicationRecord
  # Bir yorum tek bir 'Post'a aittir.
  belongs_to :post
  
  # Bir yorum opsiyonel olarak bir 'User'a aittir (anonim yorumlar için).
  belongs_to :user, optional: true 
end
