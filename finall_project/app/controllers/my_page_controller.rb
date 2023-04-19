class MyPageController < ApplicationController
  def home
    @thanks_card = ThanksCard.all.order(updated_at: :desc)
  end

  def send_thanks_card
    # @thankscard = ThanksCard.where("user_id = ? and", current_user.id)
    @thankscard = ThanksCard.where(user_id: current_user.id, delete_status: false)
    @thankscard = @thankscard.sort_by { |thankscard| (Time.zone.now - thankscard.updated_at).to_i }
    @user_receivers = @thankscard.map { |thankscard| thankscard.users_receiver }.flatten
    puts @thankscard.count
  end

  def send_new_thanks_card
    @users = User.where.not(id: current_user.id)
    # @users = User.all
    @thankscard = ThanksCard.new
    puts "list user : #{@users.count}"
  end

  def receiver
    @user_receivers = UsersReceiver.where(user_id: current_user.id, delete_status: false, users_receivers_delete: false)
    @user_receivers = @user_receivers.sort_by { |items| (Time.zone.now - items.thanks_card.updated_at).to_i }
    @siderbar = "userreceiver"
  end

  def getall_tkcard_delete
    @thankscard = ThanksCard.where(user_id: current_user.id, delete_status: true)
    @thankscard = @thankscard.sort_by { |thankscard| (Time.zone.now - thankscard.updated_at).to_i }
    render partial: "thanks_card/list_thanks_card", locals: { thanks_card: @thankscard }
  end

  def getall_tkcardreceiver_delete
    @user_receivers = UsersReceiver.where(user_id: current_user.id, delete_status: false, users_receivers_delete: true)
    @user_receivers = @user_receivers.sort_by { |user_receiver| (Time.zone.now - user_receiver.updated_at).to_i }
    render partial: "thanks_card/list_thanks_card_receiver", locals: { user_receivers: @user_receivers }
  end

end
