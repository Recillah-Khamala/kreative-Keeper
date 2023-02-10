class Post < ApplicationRecord
  after_save :inrease_postscounter
  after_destroy :decrease_postscounter

  belongs_to :author, class_name: 'User'
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

  def increase_postscounter
    author.increment!(:postscounter)
  end

  def decrease_postscounter
    author.decrement!(:postscounter)
  end
end

