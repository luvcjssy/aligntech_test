class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, null: false, default: 0.0, precision: 15, scale: 2
    end
  end
end
