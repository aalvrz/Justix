class AddBufeteIdToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :bufete_id, :integer
  end
end
