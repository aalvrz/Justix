class AddNotificacionContraparteToRecords < ActiveRecord::Migration
  def change
    add_column :records, :notificacion_contraparte, :string
  end
end
