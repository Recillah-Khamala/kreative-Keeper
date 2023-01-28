require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # def setup
  #   @user = User.create(name: "John Doe", postscounter: 0)
  #   @post = Post.create(title: "Hello World", author: @user)
  # end

  # test "update_posts_count increments the posts counter" do
  #   assert_equal 0, @user.postscounter
  #   @post.update_posts_count
  #   assert_equal 1, @user.postscounter
  # end

  # test "recent comments" do
  #   5.times { @post.comments.create(text: "Nice post") }
  #   2.times { @post.comments.create(text: "Old comment", created_at: 2.days.ago) }
  #   recent_comments = @post.recent_comments
  #   assert_equal 5, recent_comments.count
  #   assert_equal "Nice post", @post.recent_comments.first.text
  # end
end
