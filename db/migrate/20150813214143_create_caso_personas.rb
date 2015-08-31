class CreateCasoPersonas < ActiveRecord::Migration
  def change
    create_table :caso_personas do |t|
      t.integer :persona_id
      t.integer :caso_id

      t.timestamps null: false
    end
  end
end
