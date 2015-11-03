class AddBufeteIdToCasos < ActiveRecord::Migration
  def change
    add_column :casos, :bufete_id, :integer
  end
end
