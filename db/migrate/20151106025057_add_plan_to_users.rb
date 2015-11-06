class AddPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan, :string, :default => "Gratuito"
  end
end
