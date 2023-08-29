class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.timestamps
    end
    add_column :pirates, :crew_id,:int
  end
end
