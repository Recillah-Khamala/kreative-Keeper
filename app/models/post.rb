class Post < ApplicationRecord
  after_save :update_postscounter

  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :comments

  # validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # methods
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_postscounter
    author.increment!(:postscounter)
  end
end
