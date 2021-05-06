class CreateCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_products, id: false do |t|
      t.integer :category_id, null: false
      t.integer :product_id, null: false
    end
    add_index :categories_products, [:category_id, :product_id], unique: true
  end
end
