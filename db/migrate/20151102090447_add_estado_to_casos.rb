class AddEstadoToCasos < ActiveRecord::Migration
  def change
    add_column :casos, :estado, :string, :default => "En Proceso"
  end
end
