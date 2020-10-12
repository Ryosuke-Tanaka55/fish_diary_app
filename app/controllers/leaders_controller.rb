class LeadersController < ApplicationController

  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_leader, only: [:edit, :update, :destroy]
  before_action :correct_user_id

  def index
    @leaders = current_user.leaders.paginate(page: params[:page], per_page: 20)
  end

  def new
    @leader = Leader.new
  end

  def create
    @leader = @user.leaders.build(leader_params)
    if @leader.save
      flash[:success] = "新規登録しました。"
      redirect_to user_leaders_path(current_user)
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render:new
    end
  end

  def edit
  end
  
  def update
    if @reader.update_attributes(reader_params)
      flash[:success] = "リーダー情報を更新しました。"
      redirect_to user_readers_url @user
    else
      flash.now[:danger] = "リーダー更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @reader.destroy
    flash[:success] = "リーダーを削除しました。"
    redirect_to user_readers_url @user
  end


  private
    # beforeアクション
    def set_leader
      @leader = Leader.find(params[:id])
    end

    # ストロングパラメーター
    def leader_params
      params.require(:leader).permit(:leader_name, :leader_maker, :user_id)
    end

end
