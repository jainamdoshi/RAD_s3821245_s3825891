class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts, id: false do |t|
      t.integer :cart_items_id
      t.integer :user_id
      t.datetime :purchased_time

      t.timestamps
    end
    add_index :checkouts, [:cart_items_id, :user_id, :purchased_time], unique: true
  end
end
