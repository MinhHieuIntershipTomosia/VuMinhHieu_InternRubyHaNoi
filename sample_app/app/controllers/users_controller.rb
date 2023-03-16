class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # render template: 'users/show', layout: false
  end

  def new
    @user = User.new
  end
end
