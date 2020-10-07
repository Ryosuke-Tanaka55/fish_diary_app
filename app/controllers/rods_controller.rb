class RodsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_rod, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @rods = current_user.rods
  end

  def new
    
  end

  def create
    
    if @form.save
      flash[:success] = "ロッドを登録しました。"
      redirect_to user_rods_url(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_rod
      @rod = Rod.find(params[:id])
    end

    # ストロングパラメーター
    def rods_params
      params.require(:rods)
    end
end
