class RodsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_rod, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @rods = Rod.all
  end

  def new
    @form = Form::RodCollection.new
  end

  def create
    @form = Form::RodCollection.new(rod_collection_params)
    if @form.save
      flash[:success] = "#{@form.target_rods.size}件のロッドを登録しました。"
      redirect_to user_rods_path(current_user)
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
    def rod_collection_params
      params
        .require(:form_rod_collection)
        .permit(rods_attributes: :rod)
    end
end
