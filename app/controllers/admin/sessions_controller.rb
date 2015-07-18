class Admin::SessionsController < Admin::AdminController
  def login
    if params[:password] == 'password'
      cookies[:password] = 'password'
      flash[:notice] = 'You have signed in as administrator'
    end
    redirect_to admin_home_path
  end

  def logout
    cookies[:password] = ''
    redirect_to items_path
  end

end
