class CreatePpictures < ActiveRecord::Migration[5.2]
  def change
    create_table :ppictures do |t|
      t.string :photoURL
      t.integer :product_id
      
      t.timestamps
    end
  end
end
