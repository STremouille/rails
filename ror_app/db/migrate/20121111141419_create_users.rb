class CreateUsers < ActiveRecord::Migration
  def up
    	create_table :users do |t|
      		t.string :name
      		t.string :familyName
      		t.integer :age
	  		t.string :userType

      		t.timestamps
    end

    def down
    	drop_table :users
    end
  end
end
