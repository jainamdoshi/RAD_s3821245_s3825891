class CreateProductTagsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tags_products, id: false do |t|
      t.integer :product_tag_id, null: false
      t.integer :product_id, null: false
    end
    add_index :product_tags_products, [:product_tag_id, :product_id], unique: true
  end
end
