class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    @user = User.new(auth_hash: auth_hash)
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
