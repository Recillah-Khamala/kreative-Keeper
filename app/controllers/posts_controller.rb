class PostsController < ApplicationController
  def index
    author = poster
    @posts = Post.where(author)
  end

  def show
    @post = Post.find_by(id: params[:id])
    return unless @post.nil?

    'post is nil'
  end

  def poster
    params[:user]
  end
end
