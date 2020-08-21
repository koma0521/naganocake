class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :postal_code,null: false
      t.string :address,null: false
      t.string :name,null: false
      t.integer :shipping_cost,null: false,defalt: 800
      t.integer :totalpayment,null: false
      t.integer :payment_method,null: false
      t.integer :status,null: false,defalt: 0
      t.references :end_user, foreign_key: true

      t.timestamps
    end
  end
end
