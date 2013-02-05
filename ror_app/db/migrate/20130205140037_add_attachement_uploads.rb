class AddAttachementUploads < ActiveRecord::Migration
  def up
     add_column :uploads, :content_file_name, :string
     add_column :uploads, :content_content_type, :string
     add_column :uploads, :content_file_size, :int
     add_column :uploads, :content_updated_at, :int
  end

  def down
	  remove_column :uploads, :content_file_name
	  remove_column :uploads, :content_content_type
	  remove_column :uploads, :content_file_size
	  remove_column :uploads, :content_updated_at
  end
end
