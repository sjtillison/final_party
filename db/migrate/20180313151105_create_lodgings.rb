class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.string :name
      t.string :url
      t.string :address
      t.integer :city_id
      t.integer :cost_night

      t.timestamps

    end
  end
end
