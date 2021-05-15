class CreateCartsCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_cart_items, id: false do |t|
      t.integer :cart_id, null: false
      t.integer :cart_item_id, null: false
    end
    add_index :carts_cart_items, [:cart_id, :cart_item_id], unique: true
  end
end
