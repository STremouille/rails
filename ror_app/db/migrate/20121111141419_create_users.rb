class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :familyName
      t.integer :age
		t.string :profilImgUrl

      t.timestamps
    end
  end
end
