class UsersReceiverController < ApplicationController
  def show
    @users_receiver = UsersReceiver.find(params[:id])
  end
end
