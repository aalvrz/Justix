class CreateHonorarios < ActiveRecord::Migration
  def change
    create_table :honorarios do |t|
      t.datetime :fecha
      t.float :abono
      t.float :saldo
      t.integer :caso_id

      t.timestamps null: false
    end
  end
end
