# frozen_string_literal: true

# Controller for activating user accounts
class AccountActivationsController < ApplicationController
  def edit
    user = find_user_by_email
    if user && !user.activated? && activation_link_valid?(user)
      activate_user(user)
      log_in_user(user)
      flash[:success] = 'Account activated!'
    else
      flash[:danger] = 'Invalid activation link'
    end
    redirect_to root_url
  end

  private

  def find_user_by_email
    User.find_by(email: params[:email])
  end

  def activation_link_valid?(user)
    user.authenticated?(:activation, params[:id])
  end

  def activate_user(user)
    user.activate
  end

  def log_in_user(user)
    log_in user
  end
end
