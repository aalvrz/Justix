class RemovePhotoFromPersonas < ActiveRecord::Migration
  def change
    remove_column :personas, :photo
  end
end
