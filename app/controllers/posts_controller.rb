class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      @posts = @user.posts
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
