class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :devil_fruit, :string
    
  end
end
