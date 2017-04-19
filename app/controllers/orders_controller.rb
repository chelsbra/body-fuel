class OrdersController < ApplicationController
	before_action :authenticate_user!
  def submit

  	@order 		= current_order

  	@user 		= current_user.full_name
  	@address 	= current_user.address
  	@province 	= current_user.province
  	@postal		= current_user.postal_code

  	@sub_total	= @order.subtotal
  	@total 		= @sub_total

  	if @province.pst_rate.present?
  		@pst 	= (@province.pst_rate * @sub_total).to_f
  		@total += (@sub_total + @pst).to_f
  	end

  	if @province.gst_rate.present?
  		@gst 	= (@province.gst_rate * @sub_total ).to_f
  		@total += (@sub_total + @gst).to_f
  	end

  	if @province.hst_rate.present?
  		@hst 	= @province.hst_rate * @sub_total 
  		@total += (@sub_total + @hst).to_f
  	end

  	current_order.total = @total
  	@order.total = @total
  	@order.save

  end
end
