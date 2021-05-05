class CreateProductsSavedlists < ActiveRecord::Migration[5.2]
  def change
    create_table :products_savedlists, id: false do |t|
      t.integer :product_id, null: false
      t.integer :savedlist_id, null: false
    end
    add_index :products_savedlists, [:product_id, :savedlist_id], unique: true
  end
end
