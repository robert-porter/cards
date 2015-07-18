class Admin::AdminController < ApplicationController
  before_action :check_permissions, except: [:login, :home]
  layout 'admin'

  def check_permissions
    if !admin?
      render(:file => File.join(Rails.root, 'public/422.html'), :status => 422, :layout => false)
    end
  end

  def namespace
    return '/admin'
  end
end