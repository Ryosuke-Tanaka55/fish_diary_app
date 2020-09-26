class RigsController < ApplicationController
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_rig, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @rigs = current_user.rigs
  end

  def new
    @form = Form::RigCollection.new
  end

  def create
    @form = Form::RigCollection.new(rig_collection_params)
    if @form.save
      flash[:success] = "#{@form.target_rigs.size}件のリグを登録しました。"
      redirect_to user_rigs_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  def edit
    if @user.id
      flash[:danger] = "他のユーザーのリグ編集はできません。"
      redirect_to user_url(current_user)
    end
  end

  def update
    if @rig.update_attributes(rig_params)
      flash[:success] = "リグを更新しました。"
      redirect_to user_rigs_url @user
    else
      flash.now[:danger] = "リグの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @rig.destroy
    flash[:success] = "#{@rig.rig}を削除しました。"
    redirect_to user_url(current_user)
  end


  private
  # ストロングパラメーター
  def rig_collection_params
    params
      .require(:form_rig_collection)
      .permit(rigs_attributes: :rig)
  end

    def rig_params
      params.require(:rig).permit(:rig)
    end

  # beforeアクション
    def set_rig
      @rig = Rig.find(params[:id])
    end    
end
