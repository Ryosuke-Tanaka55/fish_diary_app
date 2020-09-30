class LinesController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_line, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @lines = current_user.lines
  end

  def new
    @form = Form::LineCollection.new
  end

  def create
    @form = Form::LineCollection.new(line_collection_params)
    if @form.save
      flash[:success] = "#{@form.target_lines.size}件のロッドを登録しました。"
      redirect_to user_lines_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_line
      @rod = Line.find(params[:id])
    end

    # ストロングパラメーター
    def rod_collection_params
      params
        .require(:form_line_collection)
        .permit(lines_attributes: :line)
    end
end
