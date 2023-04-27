# frozen_string_literal: true

# Controller to handle user thankscard
class ThanksCardController < ApplicationController
  before_action :test_lst_userreceiver, only: [:create]

  def index; end

  def create
    @category = Category.find(params[:thanks_card][:category])
    @thankscard = current_user.thanks_card.build(thankscard_params)
    @thankscard.category = @category

    if save_thankscard
      flash[:success] = 'ThanksCard send success!'
      redirect_to send_url
    else
      save_thankscard_error
    end
  end

  def show
    @thankscard = ThanksCard.find(params[:id])
    @siderbar = 'send'
  end

  def edit
    @thankscard = ThanksCard.find(params[:id])
    @siderbar = 'send'
  end

  def update
    @thankscard = ThanksCard.find(params[:id])
    @category = Category.find(params[:thanks_card][:category])
    @thankscard.category = @category
    if update_thankscard
      flash[:success] = 'ThanksCard update success'
    else
      flash[:danger] = 'thanksCard update Error'
    end
    redirect_to send_url
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

  # save thankscard failed
  def save_thankscard_error
    @users = User.where.not(id: current_user.id)
    @siderbar = 'sendnew'
    render 'my_page/send_new_thanks_card'
  end

  # reutrn true if save success, return false if contra
  def save_thankscard
    if @thankscard.save
      params[:thanks_card][:image].each do |item|
        @thankscard.image.attach(item)
      end
      old_updated_at = @thankscard.created_at
      @thankscard.update(updated_at: old_updated_at)
      @thankscard.create_user_receiver(params[:thanks_card][:user_receiver_id])
      return true
    end
    false
  end

  # reutrn true if save success, return false if contra
  def update_thankscard
    if @thankscard.update(thankscard_params)
      edit_image
      return true
    end
    false
  end
end
