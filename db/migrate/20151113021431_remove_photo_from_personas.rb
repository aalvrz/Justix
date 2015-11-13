class RemovePhotoFromPersonas < ActiveRecord::Migration
  def change
    remove_attachment :personas, :photo
  end
end
