class CreateGigsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.time :start_time
      t.time :end_time
      t.references :parent
      t.references :volunteer

      t.timestamps
    end
  end
end
