class CreateSighting < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.integer :pirate_id
      t.string :location
      t.integer :user_id
      t.timestamps
    end
  end
end
