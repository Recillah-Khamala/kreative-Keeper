class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).includes(comments: [:author])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes([:author]).find(params[:id])
    @comments = @post.comments.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.commentscounter = 0
    @post.likescounter = 0
    if @post.save
      flash[:success] = 'Post Added Successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post could not be added'
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to user_posts_path, notice: 'Post was deleted'
    else
      flash.now[:error] = 'Error: Post not deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
