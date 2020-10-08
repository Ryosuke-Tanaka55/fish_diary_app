class LuresController < ApplicationController

  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_lure, only: [:edit, :update, :destroy]
  before_action :correct_user_id
  
  def index
    @lures = current_user.lures.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @lure = Lure.new
  end
  
  def create
    @lure = @user.lures.build(lure_params)
    if @lure.save
      flash[:success] = "新規登録しました。"
      redirect_to user_lures_url(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end
  
    private
      # beforeアクション
      def set_lure
        @lure = Lure.find(params[:id])
      end
  
      # ストロングパラメーター
      def lure_params
        params.require(:lure).permit(:lure_name, :lure_maker, :user_id)
      end

end
