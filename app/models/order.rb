class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  enum status: [:pending, :approved, :rejected]
  
  #def add_order_items_to_order(cart)
  #  #order = Order.new(customer_id: cart.user_id, status: 0)
  #  order = Order.find_by(params[:order_id])
  #  cart.line_items.each do |item|
  #    order.order_items.build(product: item.product, quantity: item.quantity)
  #  end
  #  order.save!
  #  
  #  cart.line_items.destroy_all
  #  
  #  @new_order = order
  #end
  
  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
  
  after_initialize do
    if self.new_record?
      self.status ||= :pending
    end
  end
  
  
end
