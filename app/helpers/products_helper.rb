module ProductsHelper
  
  def product_author(product)
    user_signed_in? && current_user.id == product.user_id
  end
  
  def show_non_blank_field(label, value)
    #"<p>#{label}: #{h value}</p>" if !value.blank?
    "<p><span class='text-muted'>#{label}</span>&nbsp; #{value}</p>".html_safe if !value.blank?
  end

end
