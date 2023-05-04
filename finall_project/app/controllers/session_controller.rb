# frozen_string_literal: true

# Controller to handle user session
class SessionController < ApplicationController
  protect_from_forgery with: :null_session

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        handle_activated_user(user)
      else
        handle_unactive_user
      end
    else
      handle_invalid_credentials
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  private

  def handle_unactive_user
    message = 'Account not activated. '
    message += 'Check your email for the activation link.'
    flash.keep[:warning] = message
    redirect_to root_url
  end

  def handle_invalid_credentials
    flash.now[:danger] = 'email or password incorrect'
    render 'new'
  end

  def should_remember_user?
    return if params[:session][:remember_me].nil?

    params[:session][:remember_me] == '1'
  end

  def remember_user(user)
    should_remember_user? ? remember(user) : forget(user)
  end

  def handle_activated_user(user)
    log_in user
    remember_user(user) if should_remember_user?
    redirect_to root_url
  end
end
