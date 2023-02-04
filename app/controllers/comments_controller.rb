class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(commenter)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment added successfully'
      redirect_to user_posts_path(params[:user_id], params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def commenter
    params.require(:comment).permit(:text)
  end
end
