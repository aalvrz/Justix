class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :visita
      t.string :folio
      t.string :instancia
      t.string :actuacion
      t.string :notificacion_cliente
      t.datetime :fecha_contraparte
      t.string :notificacion_contraparte
      t.text :observaciones
      t.integer :caso_id
      
      t.timestamps null: false
    end
  end
end
