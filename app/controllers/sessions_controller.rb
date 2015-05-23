class SessionsController < ApplicationController
  def create
    if params[:password] == 'password'
      cookies[:password] = 'password'
    end
    redirect_to :back
  end

  def destroy
    puts "DESTROY"
    cookies[:password] = ''
    redirect_to :back
  end

end
