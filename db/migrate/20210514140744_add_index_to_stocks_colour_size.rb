class AddIndexToStocksColourSize < ActiveRecord::Migration[5.2]
  def change
    add_index :stocks, [:product_id, :colour, :size], unique: true
  end
end
