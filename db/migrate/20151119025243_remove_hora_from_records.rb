class RemoveHoraFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :hora
  end
end
