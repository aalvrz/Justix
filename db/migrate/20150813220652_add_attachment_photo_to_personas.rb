class AddAttachmentPhotoToPersonas < ActiveRecord::Migration
  def self.up
    change_table :personas do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :personas, :photo
  end
end
