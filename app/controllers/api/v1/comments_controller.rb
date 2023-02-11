class Api::V1::CommentsController < ApplicationController
  def index
   @user = User.find(params[:user_id])
   @post = @user.posts.where(id: params[:post_id]).includes(:comments)[0]
   
   render json: @post.comments
  end

  
  def create 
    @comment = Comment.new(comment_params.merge({author_id: current_user.id, post_id: params[:post_id]}))

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:text)
  end
end
