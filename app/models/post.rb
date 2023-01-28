class Post < ApplicationRecord
  after_save :update_postscounter

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :posts

  def update_posts_count
    author.update(postscounter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
