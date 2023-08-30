class AddStatusToPirate < ActiveRecord::Migration[7.0]
  def change
    add_column :pirates, :status, :integer
  end
end
