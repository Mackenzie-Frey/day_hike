class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :start_date
      t.integer :end_date
    end
  end
end
