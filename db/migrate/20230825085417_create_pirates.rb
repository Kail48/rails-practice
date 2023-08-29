class CreatePirates < ActiveRecord::Migration[7.0]
  def change
    create_table :pirates do |t|
      t.string :name
      t.string :position
      t.string :devil_fruit
      t.integer :bounty
      t.timestamps
    end
  end
end
