class AddSessionidToVolunteers < ActiveRecord::Migration[5.1]
  def change
      change_table :volunteers do |t|
      t.column :session_id, :string
    end
  end
end
