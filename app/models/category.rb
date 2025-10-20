class Category < ApplicationRecord
    # Bir kategori birden çok 'Post'a sahip olabilir.
    has_many :posts
end
