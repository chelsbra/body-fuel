class ChargesController < ApplicationController
	before_action :authenticate_user!
	def new
		@amount = current_order.total.to_f
	end

	def create
	  # Amount in cents
	  @amount = (current_order.total.to_f) * 100

	  @customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  @charge = Stripe::Charge.create(
	    :customer    => @customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'cad'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
