class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def item_price
    if persisted?
      self[:item_price]
    else
      product.price
    end
  end

  def taxes
    total_price * current_user.province.pst_rate
    
  end

  def total_price
    item_price * quantity + taxes
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:item_price] = item_price
    self[:total_price] = quantity * self[:item_price] + taxes
  end
end
