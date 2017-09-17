class CreateParentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :username
      t.string :name
      t.string :phone
      t.string :location
      t.string :email
      t.string :password_hash
      
      t.timestamps
    end
  end
end
