class AddSlugToCasos < ActiveRecord::Migration
  def change
    add_column :casos, :slug, :string
    add_index :casos, :slug, unique: true
  end
end
