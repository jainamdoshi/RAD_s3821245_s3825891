class AddIndexToStocksColourSize < ActiveRecord::Migration[5.2]
  def change
    add_index :stocks, [:colour, :size], unique: true
  end
end
