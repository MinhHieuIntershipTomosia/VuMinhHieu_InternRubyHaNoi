class MyPageController < ApplicationController
  def home
    @thanks_card = ThanksCard.all.order(updated_at: :desc)
  end

  def send_thanks_card
    @thankscard = ThanksCard.where("user_id = ?", current_user.id)
    @user_receivers = @thankscard.map {|thankscard| thankscard.users_receiver }.flatten
    @user_receivers = @user_receivers.sort_by { |user_receiver| -user_receiver.updated_at.to_i }
    puts @user_receivers.count
  end

  def send_new_thanks_card
    @users = User.where.not(id: current_user.id)
    # @users = User.all
    @thankscard = ThanksCard.new
    puts "list user : #{@users.count}"
  end

end
