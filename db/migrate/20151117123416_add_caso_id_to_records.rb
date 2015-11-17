class AddCasoIdToRecords < ActiveRecord::Migration
  def change
    add_column :records, :caso_id, :integer
  end
end
