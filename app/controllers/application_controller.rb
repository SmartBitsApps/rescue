class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!
  before_action :set_cart
  skip_before_action :set_cart, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout 'main/layout-without-sidenav'
  
    # protected
    
    # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:cart])
    # #devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    # #devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    # end
  
    private

    def set_cart
      
      #@user = session[:user]
      @cart ||= current_user.cart
      
    # @cart = Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    end
    
end
