class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :signed_in?

  before_action :ensure_signed_in

  def ensure_signed_in
    return if signed_in?
    redirect_to root_path, notice: "You're not signed in!"
  end

  def current_user
    User.find_by(token: session[:user_token])
  end

  def current_user= set_user
    session[:user_token] = set_user.try(:token)
  end

  def signed_in?
    current_user.present?
  end
end
