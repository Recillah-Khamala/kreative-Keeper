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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(poster)
    @post.author = current_user
    @post.likescounter = 0
    @post.commentscounter = 0

    if @post.save
      flash[:success] = 'post added successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash[:success] = 'post was not added'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def poster
    params.require(:post).permit(:title, :text)
  end
end
