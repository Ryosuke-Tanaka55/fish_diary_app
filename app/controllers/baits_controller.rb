class BaitsController < ApplicationController

  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_bait, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @baits = current_user.baits.paginate(page: params[:page], per_page: 20)
  end

  def new
    @bait = Bait.new
  end

  def create
    @bait = @user.baits.build(bait_params)
    if @bait.save
      flash[:success] = "新規登録しました。"
      redirect_to user_baits_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_bait
      @bait = Bait.find(params[:id])
    end

    # ストロングパラメーター
    def bait_params
      params.require(:bait).permit(:bait_name, :user_id)
    end

end
