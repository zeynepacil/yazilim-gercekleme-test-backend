class Tag < ApplicationRecord
    # Bir etiket birden çok 'Post'a ait olabilir (N:M).
    has_and_belongs_to_many :posts
  end