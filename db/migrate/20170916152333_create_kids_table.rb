class CreateKidsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :specific_needs
      t.references :parent
      t.references :gig

      t.timestamps
    end
  end
end
