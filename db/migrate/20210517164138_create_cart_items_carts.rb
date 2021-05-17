class CreateCartItemsCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items_carts do |t|
      t.integer :cart_id, null: false
      t.integer :cart_item_id, null: false
    end
    add_index :cart_items_carts, [:cart_item_id, :cart_id], unique: true
  end
end
