class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :commenter
      t.string :body
      t.references :user

      t.timestamps
    end
    add_index :comments, :user_id
  end

  def down
  	drop_table :comments
  end
end
