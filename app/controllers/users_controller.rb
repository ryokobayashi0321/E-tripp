class UsersController < ApplicationController
  PER_PAGE_USER = 5

  def index
    @users = User.page(params[:page]).per(PER_PAGE_USER)
  end

  def show
    @user = User.find(params[:id])
  end
end
