class ChangeRecordsFechaContraparteType < ActiveRecord::Migration
  def change
    change_column :records, :fecha_contraparte, :datetime
  end
end
