class PostsController < ApplicationController
  def index
    author = poster
    @posts = Post.where(author)
  end

  def show
    author = poster
    post_id = params[:id]
    @post = Post.where(id: post_id, author:).order('id DESC').first
    @comments = Comment.where(id: post_id, author:)
    @likes = Like.where(id: post_id, author:)
  end

  def poster
    params[:user]
  end
end
