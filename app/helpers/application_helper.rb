module ApplicationHelper

  def cart_count_over_one
    if total_cart_items > 0
      # return "<span class='tag is-dark'>#{total_cart_items}</span>".html_safe
      return `<span class="badge badge-danger indicator">#{total_cart_items}</span>`.html_safe
    end
  end

  def total_cart_items
    total = @cart.line_items.map { |item| item.quantity }.sum
    return total if total > 0
  end
  
  def total_order_items(order)
    if !order.order_items.nil? 
      total = order.order_items.map { |item| item.quantity }.sum
      return total if total > 0
    else
      return 0
    end
  end
  
  # def bootstrap_class_for(flash_type) { 
  #   success: 'alert-success',
  #   error: 'alert-danger',
  #   alert: 'alert-warning',
  #   notice: 'alert-primary'
  #   }
    
  #   [flash_type.to_sym] || flash_type.to_s 
    
  # end
end
