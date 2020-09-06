class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @diaries = Diary.where(id: @user.id)
  end

  def new
  end
end
