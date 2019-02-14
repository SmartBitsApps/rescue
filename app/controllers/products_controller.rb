class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end
  
  def all
    @products = Product.all.includes(:variants).order(:title)
  end

end