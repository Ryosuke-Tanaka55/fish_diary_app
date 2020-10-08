class ColorsController < ApplicationController

  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_color, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @colors = current_user.colors
  end

  def new
    @color = Color.new
  end

  def create
    @color = @user.colors.build(color_params)
    if @color.save
      flash[:success] = "新規登録しました。"
      redirect_to user_colors_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_color
      @color = Color.find(params[:id])
    end

    # ストロングパラメーター
    def color_params
      params.require(:color).permit(:color_name, :user_id)
    end

end
