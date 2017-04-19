class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_seesion

  helper_method :current_order

  def user_logged_in?
  	!!session[:user_id]  	
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
end
