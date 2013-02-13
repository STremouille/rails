class AddEmailColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :email, :string
  end
  def down
  	remove_column :email, :avatar_file_name
  end
end
