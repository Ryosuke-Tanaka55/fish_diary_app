class RodsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_rod, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @rods = current_user.rods.paginate(page: params[:page], per_page: 20)
  end

  def new
    @rod = Rod.new
  end

  def create
    @rod = @user.rods.build(rod_params)
    if @rod.save
      flash[:success] = "新規登録しました。"
      redirect_to user_rods_url(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  def edit
    if @user != current_user 
      flash[:danger] = "他ユーザーのロッド編集はできません。"
      redirect_to user_rods_url @user
    end
  end
  
  def update
    if @rod.update_attributes(rod_params)
      flash[:success] = "ロッド情報を更新しました。"
      redirect_to user_rods_url @user
    else
      flash.now[:danger] = "ロッド更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @rod.destroy
    flash[:success] = "ロッドを削除しました。"
    redirect_to user_rods_url @user
  end

  private
    # beforeアクション
    def set_rod
      @rod = Rod.find(params[:id])
    end

    # ストロングパラメーター
    def rod_params
      params.require(:rod).permit(:rod_name, :rod_maker, :user_id)
    end
    
end
