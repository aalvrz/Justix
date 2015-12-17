class RemoveContraparteFechaFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :fecha_contraparte
  end
end
