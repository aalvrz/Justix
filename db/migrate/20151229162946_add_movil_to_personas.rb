class AddMovilToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :movil, :string
  end
end
