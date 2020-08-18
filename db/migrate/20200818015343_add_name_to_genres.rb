class AddNameToGenres < ActiveRecord::Migration[5.2]
  def up
    add_column :genres, :name ,:string
    change_column :genres, :name, :string, :null => false
  end
 
  def down
    remove_column :genres, :name
  end
end
