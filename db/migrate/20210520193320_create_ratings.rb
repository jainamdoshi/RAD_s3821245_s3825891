class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.string :rate
      
      t.timestamps
    end
    add_index :ratings, [:user_id], unique: true 
  end
end
