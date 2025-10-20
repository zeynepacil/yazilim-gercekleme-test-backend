class User < ApplicationRecord
    # Bir kullanıcı birden çok 'Post'a sahip olabilir.
    has_many :posts, dependent: :destroy
    # Bir kullanıcı birden çok 'Comment'a sahip olabilir.
    has_many :comments
end
