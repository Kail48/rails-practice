class CreatePoster < ActiveRecord::Migration[7.0]
  def change
    create_table :posters do |t|
      t.integer :pirate_id
      t.timestamps
    end
  end
end
