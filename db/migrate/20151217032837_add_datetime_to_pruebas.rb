class AddDatetimeToPruebas < ActiveRecord::Migration
  def change
    add_column :pruebas, :fecha, :datetime
  end
end
