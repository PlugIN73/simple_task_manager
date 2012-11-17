class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  helper_method :current_user, :signed_in?

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    session[:user_id] && User.find(session[:user_id])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
