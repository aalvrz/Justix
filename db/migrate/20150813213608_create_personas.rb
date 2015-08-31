class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :num_registro
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :telefono
      t.string :estado_civil
      t.string :email
      t.string :domicilio
      t.string :type

      t.timestamps null: false
    end
  end
end
