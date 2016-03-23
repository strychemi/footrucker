class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :location_description
      t.string :address
      t.string :foods
      t.decimal :longitude
      t.decimal :latitude
      t.string :schedule
      
      t.timestamps null: false
    end
  end
end
