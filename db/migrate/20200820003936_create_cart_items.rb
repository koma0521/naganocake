class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :amount,presence: true
      t.references :item, foreign_key: true,presence: true
      t.references :end_user, foreign_key: true,presence: true

      t.timestamps
    end
  end
end
