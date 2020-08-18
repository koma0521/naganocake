class ChangeIsActiveOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :is_active, :boolean, null: false, default: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end

  def down
    change_column :genres, :is_active, :boolean, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
