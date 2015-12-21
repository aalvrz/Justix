class ChangeNotificacionClienteToDatetime < ActiveRecord::Migration
  def change
    remove_column :records, :notificacion_cliente
    add_column :records, :notificacion_cliente, :datetime
  end
end
