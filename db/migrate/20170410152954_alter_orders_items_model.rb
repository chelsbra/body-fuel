class AlterOrdersItemsModel < ActiveRecord::Migration[5.0]
  def change
  	change_table :order_items do |t|
  		t.rename :total_price, :total_price
  end
  end
end
