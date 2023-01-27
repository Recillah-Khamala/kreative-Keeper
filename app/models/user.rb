class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
end
