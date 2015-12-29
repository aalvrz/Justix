class AddMovilToBufetes < ActiveRecord::Migration
  def change
    add_column :bufetes, :movil, :string
  end
end
