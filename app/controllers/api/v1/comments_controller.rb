class Api::V1::CommentsController < ApplicationController
  def index
   @user = User.find(params[:user_id])
   @post = @user.posts.where(id: params[:post_id]).includes(:comments)[0]
   
   render json: @post.comments
  end
end