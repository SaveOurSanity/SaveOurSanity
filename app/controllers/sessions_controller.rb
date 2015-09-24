class SessionsController < ApplicationController

  skip_before_action :ensure_signed_in

  def new
    redirect_to '/auth/github'
  end

  def create
    @user = User.find_by(email: auth_hash[:info][:email])
    @user ||= User.new
    @user.auth_hash = auth_hash
    @user.save!
    self.current_user = @user
    redirect_to :back, notice: "Signed in as #{current_user}"
  end

  def destroy
    self.current_user = nil
    redirect_to :back, notice: "Successfully signed out"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
