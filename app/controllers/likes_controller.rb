class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author = current_user
    @like.post_id = params[:post_id]

    if @like.save
      flash[:success] = 'You liked this post!'
      redirect_to "/users/#{params[:author_id]}/posts/#{params[:post_id]}"
    else
      flash[:danger] = 'Not able to like this post!!!'
    end
  end
end
