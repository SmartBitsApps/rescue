class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  
  enum status: [ :empty, :active, :closed ]
  
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(product_id: product.id)
    end
    
    #current_item
    current_item
    #redirect_to root_path
    #current_item and redirect_to products_path
    # current_item and return
  end
  
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
