class CreateHonorarios < ActiveRecord::Migration
  def change
    create_table :honorarios do |t|
      t.datetime :fecha
      t.decimal :abono, :precision => 10, :scale => 2, :default => 0.00
      t.integer :caso_id

      t.timestamps null: false
    end
  end
end
