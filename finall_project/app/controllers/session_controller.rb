class SessionController < ApplicationController
  protect_from_forgery with: :null_session

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        puts "#{flash[:warning]}"
        flash.keep(:warning)
        redirect_to root_url
      end
    else
      flash.now[:danger] = "email or password incorrect"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
end
