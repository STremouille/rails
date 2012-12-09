class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :user_types, :user_id
  end
end
