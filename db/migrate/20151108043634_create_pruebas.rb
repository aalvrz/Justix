class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.string :titulo
      t.text :descripcion
      t.string :archivo
      t.integer :caso_id

      t.timestamps null: false
    end
  end
end
