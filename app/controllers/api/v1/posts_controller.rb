class Api::V1::PostsController < ApplicationController
  def index
    @posts = User.find(params[:id]).posts

    render json: @posts
  end
end
