class CreateVolunteersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.string :qualifications
      t.string :phone
      t.string :hometown

      t.timestamps
    end
  end
end
