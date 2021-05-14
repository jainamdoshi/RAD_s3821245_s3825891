class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :colour
      t.string :size
      t.integer :quantity

      t.timestamps
    end
    
  end
end
