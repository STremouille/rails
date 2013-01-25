class AddAvatar < ActiveRecord::Migration
  def change
     add_column :users, :avatar_file_name, :string
     add_column :users, :avatar_content_type, :string
     add_column :users, :avatar_file_size, :int
     add_column :users, :avatar_updated_at, :int
  end
end
