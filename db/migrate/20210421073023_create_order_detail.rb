class CreateOrderDetail < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price, null: false, default: 0.0, precision: 15, scale: 2
      t.integer :quantity, null: false, default: 0
    end
  end
end
