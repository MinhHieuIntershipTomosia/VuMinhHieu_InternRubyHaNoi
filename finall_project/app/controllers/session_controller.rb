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
        redirect_to root_url
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash.keep[:warning] = message
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

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
