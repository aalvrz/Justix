class ChangeNotificacionClienteToDatetime < ActiveRecord::Migration
  def change
    change_column :records, :notificacion_cliente, 'datetime USING CAST(notificacion_cliente AS datetime)'
  end
end
