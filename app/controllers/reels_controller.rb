class ReelsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_reel, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @reels = current_user.reels.paginate(page: params[:page], per_page: 20)
  end

  def new
    @reel = Reel.new
  end

  def create
    @reel = @user.reels.build(reel_params)
    if @reel.save
      flash[:success] = "新規登録しました。"
      redirect_to user_reels_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  def edit
  end
  
  def update
    if @reel.update_attributes(reel_params)
      flash[:success] = "リール情報を更新しました。"
      redirect_to user_reels_url @user
    else
      flash.now[:danger] = "リール更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @reel.destroy
    flash[:success] = "リールを削除しました。"
    redirect_to user_reels_url @user
  end


  private
    # beforeアクション
    def set_reel
      @reel = Reel.find(params[:id])
    end

    # ストロングパラメーター
    def reel_params
      params.require(:reel).permit(:reel_name, :reel_maker, :user_id)
    end
    
end
