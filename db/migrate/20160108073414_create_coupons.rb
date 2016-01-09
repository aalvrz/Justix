class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :plan
      t.integer :user_id
      t.string :issuer

      t.timestamps null: false
    end
  end
end
