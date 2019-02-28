class DashboardController < ApplicationController
  layout 'dashboard'  
  
  def index
    @orders = Order.order("created_at DESC").last(10)
  end
  
  def orders
    @orders = Order.all.order("created_at DESC")
  end
end
