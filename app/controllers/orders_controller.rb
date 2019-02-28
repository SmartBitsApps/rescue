class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  # def new
  #   @order_item = OrderItem.new
  # end
  def index
    @orders = Order.where(customer_id: current_user.id).order("created_at DESC")#.paginate(:page => params[:page], :per_page => 9)
  end
  
  def show
    
    @order_items = @order.order_items
  end
  
  def update_status
    
    @order = Order.find(params[:order_id])
    
    if @order
      @order.update_attributes(status: params[:status])
    else
      redirect_to dashboard_path
    end
    
    redirect_to dashboard_path, notice: t(".#{params[:status]}")

  end

  # POST /orders
  # POST /orders.json
  def create
   
    @order = Order.create(customer_id: @cart.user_id, status: 0)
    @cart.line_items.each do |item|
      @order.order_items.build(product: item.product, quantity: item.quantity)
    end

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
      @order = Order.find(params[:id])
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

