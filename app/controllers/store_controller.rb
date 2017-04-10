class StoreController < ApplicationController
  has_scope :by_type, type: :array

  def search
  end

  def search_results
    @types = Type.order("name")   
   @found_products = Product.where(nil).page(params[:page]).per(2)
      
    @found_products = @found_products.keywords(params[:search_keywords]) if params[:search_keywords].present?
    @found_products = @found_products.high_protein(params[:product][:type_id].to_i) if params[:product][:type_id].present?
    @order_item = current_order.order_items.new

    #keyword_search(params[:type_id], params[:search_keywords])  	
  end

  private

  # def search_results_params
  # 	params.require(:search_keywords, :product).permit(:search_keywords, :type_id)  	
  # end
end
