class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # beforeフィルター

  # paramsハッシュからユーザーを取得する。
  def set_user
    @user = User.find(params[:id])
  end

  # paramsハッシュからユーザー情報を取得する。
  def set_user_id
    @user = User.find(params[:user_id])
  end

  # @userに現在ログインしているユーザーをセットする。
  def set_current_user
    @user = current_user
  end

  # ログイン済みのユーザーか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "他のユーザー情報は閲覧できません。"
      redirect_to root_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認（user_id）
  def correct_user_id
    @user = User.find(params[:user_id])
  end

  # システム管理者かどうか判定
  def admin_user
    unless current_user.admin?
      flash[:danger] = "管理者権限がありません。"
      redirect_to root_url
    end
  end
end