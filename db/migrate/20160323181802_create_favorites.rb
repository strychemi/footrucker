class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :truck_id

      t.index [:user_id, :truck_id], unique: true
      
      t.timestamps null: false
    end
  end
end
