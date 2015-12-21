class RemoveSaldoFromHonorarios < ActiveRecord::Migration
  def change
    remove_column :honorarios, :saldo
  end
end
