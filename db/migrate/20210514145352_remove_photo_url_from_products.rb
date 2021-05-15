class RemovePhotoUrlFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :photoURL, :string
  end
end
