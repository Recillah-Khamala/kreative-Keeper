class PostsController < ApplicationController
  def index
    author = poster
    @posts = Post.where(author)
  end

  def show
    author = poster
    post_id = params[:id]
    @post = Post.where(id: post_id, author:).order('id DESC').first
    @comments = Comment.where(post_id:)
    @likes = Likes.where(post_id:)
  end

  def poster
    params[:user]
  end
end
