class SessionsController < ApplicationController
  def create
    if params[:password] == 'password'
      cookies[:password] = 'password'
      flash[:notice] = 'You have signed in as administrator'
      @is_admin = true
    end
    redirect_to sessions_path
  end

  def destroy
    cookies[:password] = ''
    @is_admin = false
    redirect_to sessions_path
  end

end
