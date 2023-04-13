class ThanksCardController < ApplicationController
  before_action :test_lst_userreceiver, only: [:create]
  def index
  end


  def create
    puts request.POST
    @category = Category.find(params[:thanks_card][:category])
    @thankscard = current_user.thanks_card.build(thankscard_params)
    @thankscard.category = @category
    if @thankscard.save
      @thankscard.create_user_receiver(params[:thanks_card][:user_receiver_id])
      flash[:success] = "ThanksCard send success!"
      redirect_to send_url
    else
      @users = User.where.not(id: current_user.id)
      @action_name = "error_new_thanks_card"
      render "my_page/send_new_thanks_card"
    end
  end

  def edit
    @thankscard = ThanksCard.find(params[:id])
    
  end


  private

  def thankscard_params
    params.require(:thanks_card).permit(:title, :content, :description)
  end
end
