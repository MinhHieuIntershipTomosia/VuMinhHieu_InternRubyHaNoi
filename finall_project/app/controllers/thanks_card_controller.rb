class ThanksCardController < ApplicationController 
  def index
  end

  def create
    puts request.POST
    @thankscard = current_user.thanks_card.build(thankscard_params)
    if @thankscard.save 
      flash[:success] = "ThanksCard send success!"
      redirect_to send_url
    else
      render "my_page/send_new_thanks_card"
    end
  end

  private 
  def thankscard_params
    params.require(:thanks_card).permit(:title, :content, :description)
  end
end
