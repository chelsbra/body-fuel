class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :delivery, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.references :order_statuses, foreign_key: true

      t.timestamps
    end
  end
end
