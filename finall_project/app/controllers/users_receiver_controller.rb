# frozen_string_literal: true

# Controller to handle user
class UsersReceiverController < ApplicationController
  def show
    @users_receiver = UsersReceiver.find(params[:id])
    @siderbar = 'userreceiver'
  end

  def destroy
    @users_receiver = UsersReceiver.find(params[:id])
    @users_receiver.update(users_receivers_delete: true)
    redirect_to receiver_url
  end
end
