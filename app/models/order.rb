class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_validation :set_order_status
  before_save :update_subtotal
  belongs_to :user

  def subtotal
  	order_items.collect { |oi| oi.valid? ? (oi.quantity.to_i * oi.item_price.to_f) : 0 }.sum 
  end

  # def tax
  #   (subtotal * user_id.province.pst_rate) + (subtotal * user_id.province.gst_rate)
  # end

private
  def set_order_status
  	self.order_status_id = 1  	
  end

  def update_subtotal
  	self[:subtotal] = subtotal  	
  end

  def update_tax
    self[:tax] = tax
  end

end
