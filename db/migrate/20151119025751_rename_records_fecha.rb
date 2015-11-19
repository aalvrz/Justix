class RenameRecordsFecha < ActiveRecord::Migration
  def change
    rename_column :records, :fecha, :fecha_contraparte
  end
end
