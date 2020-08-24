class AddSaleStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sale_status, :boolean,null: false,default: true
  end
end
