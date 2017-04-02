class ProductsController < ApplicationController
  def index
  	@types = Type.order("name")
  	@products = Product.order("name").page(params[:page]).per(2)
  end

  def show
  	@product = Product.find(params[:id])
  end
end
