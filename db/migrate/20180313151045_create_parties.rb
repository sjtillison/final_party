class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :type_id
      t.integer :city_id
      t.date :start_date
      t.date :end_date
      t.integer :lodging_id

      t.timestamps

    end
  end
end
