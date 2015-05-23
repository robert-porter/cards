module SessionsHelper

  def is_admin?
    @is_admin
  end

  def login
    @is_admin = true
  end

  def logout
    @is_admin = false
  end
end
