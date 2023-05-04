# frozen_string_literal: true

# Controller to display view mypage
class MyPageController < ApplicationController
  def home
    @thanks_card = ThanksCard.all.order(updated_at: :desc)
  end

  def send_thanks_card
    @thankscard = thankscard_status(false)
    @thankscard = sort_by_update_at(@thankscard)
    @user_receivers = @thankscard.map(&:users_receiver).flatten
  end

  def send_new_thanks_card
    @users = User.where.not(id: current_user.id)
    @thankscard = ThanksCard.new
  end

  def receiver
    @user_receivers = user_receiver_status(false)
    @user_receivers = sort_by_update_at(@user_receivers, 'thanks_card')
    @siderbar = 'userreceiver'
  end

  def getall_tkcard_delete
    @thankscard = thankscard_status(true)
    @thankscard = sort_by_update_at(@thankscard)
    render partial: 'thanks_card/list_thanks_card', locals: { thanks_card: @thankscard }
  end

  def getall_tkcardreceiver_delete
    @user_receivers = user_receiver_status(true)
    @user_receivers = sort_by_update_at(@user_receivers)
    render partial: 'thanks_card/list_thanks_card_receiver', locals: { user_receivers: @user_receivers }
  end

  def report
    @user_send = top_one_send
    @user_receiver = top_one_receiver
    @all = ThanksCard.where(delete_status: false).count
    @count_tkcard = thankscard_status(false).count
    @count_receiver = user_receiver_status(false).count
  end
end
