class InquiriesController < ApplicationController
  before_action :admin_user, only: [:index, :show, :destroy]

  def index
    @inquires = Inquiry.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquery.new(inquiry_params)
    if @inquiry.save
      flash[:success] = "お問い合わせを受け付けました。"
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = "入力にエラーがありました。"
      render :new
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:email, :inquiry_title, :inquiry_detail)
    end

end
