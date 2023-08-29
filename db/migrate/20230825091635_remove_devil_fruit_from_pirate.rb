class RemoveDevilFruitFromPirate < ActiveRecord::Migration[7.0]
  def change
    remove_column :pirates, :devil_fruit
    remove_column :users, :devil_fruit

  end
end
