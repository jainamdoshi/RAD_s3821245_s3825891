class AddIndexToPpicturesPhotoUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :ppictures, :photoURL, unique: true
  end
end
