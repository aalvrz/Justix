class AddSlugToBufetes < ActiveRecord::Migration
  def change
    add_column :bufetes, :slug, :string
    add_index :bufetes, :slug, unique: true
  end
end
