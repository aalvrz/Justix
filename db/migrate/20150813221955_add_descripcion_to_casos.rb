class AddDescripcionToCasos < ActiveRecord::Migration
  def change
    add_column :casos, :descripcion, :text
  end
end
