class AddUserIdToBufetes < ActiveRecord::Migration
  def change
    add_column :bufetes, :user_id, :integer
  end
end
