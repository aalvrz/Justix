class AddDescripcionToBufetes < ActiveRecord::Migration
  def change
    add_column :bufetes, :descripcion, :text
  end
end
