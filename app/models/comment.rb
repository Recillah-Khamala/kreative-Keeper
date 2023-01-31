class Comment < ApplicationRecord
  after_save :update_commentscounter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  # validations
  validates :author, presence: true
  validates :post, presence: true
  validates :text, presence: true

  private

  def update_commentscounter
    post.increment!(:commentscounter)
  end
end
