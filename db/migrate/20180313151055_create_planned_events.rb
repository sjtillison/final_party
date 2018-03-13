class CreatePlannedEvents < ActiveRecord::Migration
  def change
    create_table :planned_events do |t|
      t.integer :party_id
      t.integer :activity_id

      t.timestamps

    end
  end
end
