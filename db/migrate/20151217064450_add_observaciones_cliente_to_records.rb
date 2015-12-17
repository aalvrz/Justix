class AddObservacionesClienteToRecords < ActiveRecord::Migration
  def change
    add_column :records, :observaciones_cliente, :string
  end
end
