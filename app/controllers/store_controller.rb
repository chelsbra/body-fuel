class StoreController < ApplicationController
  has_scope :by_type, type: :array

  def search
  end

  def search_results
    @types = Type.order("name")   
    @found_products = Product.where(nil).page(params[:page]).per(2)
      
    @found_products = Product.keywords(params[:search_keywords]).page(params[:page]).per(2) if params[:search_keywords].present?
    @found_products = Product.high_protein(params[:type_id].to_i).page(params[:page]).per(2) if params[:type_id].present?

    #keyword_search(params[:type_id], params[:search_keywords])  	
  end

  private

  # def search_results_params
  # 	params.require(:search_keywords, :product).permit(:search_keywords, :type_id)  	
  # end
end
