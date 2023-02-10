class Comment < ApplicationRecord
  after_save :increase_commentscounter
  after_destroy :decrease_commentscounter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  # validations
  validates :author, presence: true
  validates :post, presence: true
  validates :text, presence: true

  private

  def increase_commentscounter
    post.increment!(:commentscounter)
  end

  def decrease_commentscounter
    post.decrement!(:commentscounter)
  end
end
