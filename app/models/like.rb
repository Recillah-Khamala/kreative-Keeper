class Like < ApplicationRecord
  after_save :update_likescounter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  private
  def update_likescounter
    post.increment!(:likescounter)
  end
end
