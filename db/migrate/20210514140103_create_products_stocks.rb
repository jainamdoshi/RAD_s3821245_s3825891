class CreateProductsStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :products_stocks, id: false do |t|
      t.integer :product_id, null: false
      t.integer :stock_id, null: false
    end
    add_index :products_stocks, [:product_id, :stock_id], unique: true
  end
end
