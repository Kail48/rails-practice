class AddStatusToBounty < ActiveRecord::Migration[7.0]
  def change
    add_column :posters, :status, :integer
  end
end
