class ProductsController < ApplicationController
  def index
  	@types = Type.order("name")
  	@products = Product.order("name").page(params[:page]).per(2)

  	@order_item = current_order.order_items.new
  end

  def show
  	@product = Product.find(params[:id])
  end
end
