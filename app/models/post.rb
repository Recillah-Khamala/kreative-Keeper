class Post < ApplicationRecord
  after_save :update_postscounter

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  # methods
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.increment!(:postscounter)
  end
end
