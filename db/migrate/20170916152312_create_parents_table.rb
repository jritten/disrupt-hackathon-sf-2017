class CreateParentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
      t.string :location
      
      t.timestamps
    end
  end
end
