class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    params[:id]
  end
end
