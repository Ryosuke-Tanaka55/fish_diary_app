class ReelsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_reel, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @reels = current_user.reels
  end

  def new
    @form = Form::ReelCollection.new
  end

  def create
    @form = Form::ReelCollection.new(reel_collection_params)
    if @form.save
      flash[:success] = "#{@form.target_rods.size}件のリールを登録しました。"
      redirect_to user_reels_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  private
    # beforeアクション
    def set_reel
      @rod = Reel.find(params[:id])
    end

    # ストロングパラメーター
    def reel_collection_params
      params
        .require(:form_reel_collection)
        .permit(reels_attributes: :reel)
    end
end
