class ThanksCardController < ApplicationController
  before_action :test_lst_userreceiver, only: [:create]

  def index
  end

  def create
    puts request.POST
    @category = Category.find(params[:thanks_card][:category])
    @thankscard = current_user.thanks_card.build(thankscard_params)
    @thankscard.category = @category
    params[:thanks_card][:image].each do |items|
      @thankscard.image.attach(items)
    end
    if @thankscard.save
      old_updated_at = @thankscard.created_at
      @thankscard.update(updated_at: old_updated_at)
      @thankscard.create_user_receiver(params[:thanks_card][:user_receiver_id])
      flash[:success] = "ThanksCard send success!"
      redirect_to send_url
    else
      @users = User.where.not(id: current_user.id)
      render "my_page/send_new_thanks_card"
    end
  end

  def show
    @thankscard = ThanksCard.find(params[:id])
    @siderbar = "send"
  end

  def edit
    @thankscard = ThanksCard.find(params[:id])
    @siderbar = "send"
  end

  def update
    @thankscard = ThanksCard.find(params[:id])
    @category = Category.find(params[:thanks_card][:category])
    @thankscard.category = @category
    arr = params[:thanks_card][:edit].split(",")
    arr.each_with_index do |items, index|
      @image = @thankscard.image.find(items.to_i)
      @image.purge
      @thankscard.image.attach(params[:thanks_card][:image][index + 1])
    end
    if @thankscard.update(thankscard_params)
      flash[:success] = "ThanksCard update success"
      redirect_to send_url
    else
      flash[:danger] = "thanksCard update Error"
      redirect_to send_url
    end
    puts @params
  end

  def destroy
    @thankscard = ThanksCard.find(params[:id])
    @thankscard.update(delete_status: true)
    redirect_to send_url
  end

  private

  def thankscard_params
    params.require(:thanks_card).permit(:title, :content, :description)
  end
end
