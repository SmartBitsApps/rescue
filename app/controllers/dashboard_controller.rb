class DashboardController < ApplicationController
  before_action :ensure_admin_or_manager
  layout 'dashboard'  
  
  def index
    @orders = Order.order("created_at DESC").last(10)
  end
  
  def orders
    @orders = Order.all.order("created_at DESC")
  end
  
  private
  
    def ensure_admin_or_manager
      
      if current_user.admin? || current_user.manager?
        true
      else
        redirect_to root_path
      end
    end
end
