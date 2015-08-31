class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.string :nombre
      t.string :num_accion
      t.string :accion
      t.string :materia
      t.string :oficina

      t.timestamps null: false
    end
  end
end
