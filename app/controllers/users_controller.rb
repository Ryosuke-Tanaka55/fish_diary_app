class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @diaries = Diary.where(id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインする。
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :tel, :prefecture, :password, :password_confirmation)
    end

end
