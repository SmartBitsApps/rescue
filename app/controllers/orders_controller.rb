class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  # def new
  #   @order_item = OrderItem.new
  # end
  
  
  def show
    @order_items = @order.order_items
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = Order.new(order_params)
    #cart = current_user.cart
    #@order = Order.build(customer_id: cart.user_id, status: 0)
    #@new_order = @order.add_order_items_to_order(cart)
    
  
    #cart = Cart.find(params[:cart_id])
    @order = Order.create(customer_id: @cart.user_id, status: 0)
    @cart.line_items.each do |item|
      @order.order_items.build(product: item.product, quantity: item.quantity)
    end
    # throw(:abort) if @cart.line_items.map { |item| item.quantity }.sum.equal?(@order.total_order_items)
     
    
    #@cart.line_items.destroy_all
    destroy_all_cart_line_items
   
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to products_path, notice: 'Košík byl odeslán.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to cart_path, notice: 'Oops.. stala se chyba, košík nebyl odeslán.'}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :status)
    end
    
    def invalid_order
      logger.error "Attempt to access ivalid order #{params[:id]}"
      redirect_to root_path, notice: "Tato objednávka neexistuje."
    end
    
    def destroy_all_cart_line_items
      #check for same sum of cart items
      c = @cart.line_items.map { |item| item.quantity }.sum
      o = @order.order_items.map { |item| item.quantity }.sum
      if c.equal?(o)
        @cart.line_items.destroy_all
      else
        ErrorLogger.log(Time.now, "Something went wrong! #{@cart.line_items.to_s}")
      end
    
    
    end
end

