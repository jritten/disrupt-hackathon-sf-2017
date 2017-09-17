class CreateVolunteersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.integer :age
      t.string :phone
      t.string :hometown
      t.string :qualifications
      t.text :description
      t.string :email
      t.string :password_hash

      t.timestamps
    end
  end
end
