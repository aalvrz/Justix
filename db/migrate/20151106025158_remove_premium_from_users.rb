class RemovePremiumFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :premium
  end
end
