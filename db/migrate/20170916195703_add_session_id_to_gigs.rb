class AddSessionIdToGigs < ActiveRecord::Migration[5.1]
  def change
    change_table :gigs do |t|
      t.column :session_id, :string
    end
  end
end
