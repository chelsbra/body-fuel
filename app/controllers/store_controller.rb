class StoreController < ApplicationController
  def search
  end

  def search_results
  	keywords = "%" + params[:Search_keywords] + "%"
  	@found_products = Product.keyword_search(params[:Search_keywords])
  end
end
