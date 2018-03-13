class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :notes
      t.integer :cost_pp
      t.integer :city_id
      t.string :website

      t.timestamps

    end
  end
end
