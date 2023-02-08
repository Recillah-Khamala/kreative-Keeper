class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).includes(comments: [:author])
  end

  def show
    @post = Post.includes([:author, :comments]).find(params[:id])
    @comments = @post.comments.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    if @post.save
      flash[:success] = 'post added successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash[:success] = 'post was not added'
      render :new, status: :unprocessable_entity
    end
  end
end
