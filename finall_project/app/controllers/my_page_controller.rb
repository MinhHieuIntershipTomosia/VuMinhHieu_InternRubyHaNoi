class MyPageController < ApplicationController
  def home
    @thanks_card = ThanksCard.all.order(updated_at: :desc)
  end

  def send_thanks_card
    # @thankscard = ThanksCard.where("user_id = ? and", current_user.id)
    @thankscard = ThanksCard.where(user_id: current_user.id, delete_status: false)
    @thankscard = @thankscard.sort_by{|thankscard| (Time.zone.now - thankscard.updated_at).to_i}
    @user_receivers = @thankscard.map {|thankscard| thankscard.users_receiver }.flatten
    puts @thankscard.count
  end

  def send_new_thanks_card
    @users = User.where.not(id: current_user.id)
    # @users = User.all
    @thankscard = ThanksCard.new
    puts "list user : #{@users.count}"
  end

  def receiver
    
  end

  def getall_tkcard_delete
    @thankscard = ThanksCard.where(user_id: current_user.id, delete_status: true)
    render partial: 'thanks_card/list_thanks_card', locals: { thanks_card: @thankscard }
  end
end
