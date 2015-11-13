class AddPhotoToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :photo, :string
  end
end
