class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @post = User.find(params[:id])
  end
end
