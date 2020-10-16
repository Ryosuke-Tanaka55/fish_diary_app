class ContactsController < ApplicationController
  before_action :set_user_id, only: [:new, :index]
  before_action :set_current_user, only: [:index, :new, :create]
  before_action :logged_in_user
  before_action :admin_user, only: :index

  def index
    @contacts = Contact.all.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.find_by(params[:user_id])
    @contact = Contact.new
  end

  def create
    @contact = @user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = "お問い合わせを受け付けました。"
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = "入力にエラーがありました。"
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:question_title, :question_detail, :user_id)
    end
end
