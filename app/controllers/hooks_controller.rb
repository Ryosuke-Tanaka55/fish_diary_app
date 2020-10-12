class HooksController < ApplicationController

  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_hook, only: [:edit, :update, :destroy]
  before_action :correct_user_id
  
  def index
    @hooks = current_user.hooks.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @hook = Hook.new
  end
  
  def create
    @hook = @user.hooks.build(hook_params)
    if @hook.save
      flash[:success] = "新規登録しました。"
      redirect_to user_hooks_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  def edit
  end
  
  def update
    if @hook.update_attributes(hook_params)
      flash[:success] = "フック情報を更新しました。"
      redirect_to user_hooks_url @user
    else
      flash.now[:danger] = "フック更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @hook.destroy
    flash[:success] = "フックを削除しました。"
    redirect_to user_hooks_url @user
  end

    private
      # beforeアクション
      def set_hook
        @hook = Hook.find(params[:id])
      end
  
      # ストロングパラメーター
      def hook_params
        params.require(:hook).permit(:hook_name, :hook_maker, :user_id)
      end

end