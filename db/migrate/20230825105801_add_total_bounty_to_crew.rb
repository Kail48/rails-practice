class AddTotalBountyToCrew < ActiveRecord::Migration[7.0]
  def change
    add_column :crews,:bounty,:integer
  end
end
