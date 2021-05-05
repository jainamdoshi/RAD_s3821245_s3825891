class CreateSavedlists < ActiveRecord::Migration[5.2]
  def change
    create_table :savedlists do |t|

      t.timestamps
    end
  end
end
