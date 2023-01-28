class Comment < ApplicationRecord
  after_save :update_commentscounter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_commentscounter
    post.update(commentscounter: post.comments.count)
  end
end
