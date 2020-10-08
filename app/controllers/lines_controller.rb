class LinesController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_line, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @lines = current_user.lines.paginate(page: params[:page], per_page: 20)
  end

  def new
    @line = Line.new
  end

  def create
    @line = @user.lines.build(line_params)
    if @line.save
      flash[:success] = "新規登録しました。"
      redirect_to user_lines_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_line
      @line = Line.find(params[:id])
    end

    # ストロングパラメーター
    def line_params
      params.require(:line).permit(:line_name, :line_maker, :user_id)
    end
    
end
