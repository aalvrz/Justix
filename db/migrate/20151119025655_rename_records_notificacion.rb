class RenameRecordsNotificacion < ActiveRecord::Migration
  def change
    rename_column :records, :notificacion, :notificacion_cliente
  end
end
