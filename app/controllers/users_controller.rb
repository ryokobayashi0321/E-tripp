class UsersController < ApplicationController
  PER_PAGE = 1

  def index
    @users = User.page(params[:page]).per(PER_PAGE)
  end

  def show
    @user = User.find(params[:id])
  end
end
