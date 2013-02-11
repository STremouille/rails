class CreateUploads < ActiveRecord::Migration
  def up
    create_table :uploads do |t|
	t.string :name
	t.text :description
	t.string :uploadGroup
  t.integer :ownerId
	end
  end

  def down
    drop_table :uploads
  end
end
