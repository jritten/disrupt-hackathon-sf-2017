class CreateKidsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.integer :age
      t.string :specific_needs
      t.string :location
      t.references :parent
      t.references :gig

      t.timestamps
    end
  end
end
