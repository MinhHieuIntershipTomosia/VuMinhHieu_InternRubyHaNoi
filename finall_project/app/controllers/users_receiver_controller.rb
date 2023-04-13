class UsersReceiverController < ApplicationController
  def show
    @users_receiver = UsersReceiver.find(params[:id])
    @action_name = "show UsersReciver"
  end
end
