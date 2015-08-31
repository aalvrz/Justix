class AddOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner, :boolean, :default => false
  end
end
