class ChangeNotificacionContraparteToDatetime < ActiveRecord::Migration
  def change
    remove_column :records, :notificacion_contraparte
    add_column :records, :notificacion_contraparte, :datetime
  end
end
