module OrderHelper
  
  # for views/orders/_order.html.erb badges icons with text
  
  def order_status_badge(order)
    status = order.status
    badge = nil
    if status["pending"]
      badge = "primary"
    elsif status["approved"]
      badge = "success"
    else status["rejected"]
      badge = "danger"
    end
    
    badge
  end
  
  def order_status_badge_text(order)
    status = order.status
    badge_text = nil
    if status["pending"]
      badge_text = "probíhá"
    elsif status["approved"]
      badge_text = "dokončeno"
    else status["rejected"]
      badge_text = "zrušeno"
    end
    
    badge_text
  end
    
end
