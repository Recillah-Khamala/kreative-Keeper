class Post < ApplicationRecord
  after_save :update_postscounter

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private
  def update_posts_count
    author.increment!(:postscounter)
  end
end
