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

  def edit
  end
  
  def update
    if @line.update_attributes(line_params)
      flash[:success] = "ライン情報を更新しました。"
      redirect_to user_lines_url @user
    else
      flash.now[:danger] = "ライン更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @line.destroy
    flash[:success] = "ラインを削除しました。"
    redirect_to user_lines_url @user
  end

  def edit
  end
  
  def update
    if @line.update_attributes(line_params)
      flash[:success] = "ライン情報を更新しました。"
      redirect_to user_lines_url @user
    else
      flash.now[:danger] = "ライン更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @line.destroy
    flash[:success] = "ラインを削除しました。"
    redirect_to user_lines_url @user
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
