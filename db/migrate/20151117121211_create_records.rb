class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :visita
      t.time :hora
      t.string :instancia
      t.string :folio
      t.string :actuacion
      t.date :fecha
      t.string :notificacion
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
