class AlterOrderStatusModel < ActiveRecord::Migration[5.0]
  def change
  	change_table :orders do |t|
  		t.rename :order_statu_id, :order_status_id
  	end
  end
end
