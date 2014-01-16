class CreateProposedLocations < ActiveRecord::Migration
  def change
    create_table :proposed_locations do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
  end
end
