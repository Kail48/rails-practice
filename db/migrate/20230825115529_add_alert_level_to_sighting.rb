class AddAlertLevelToSighting < ActiveRecord::Migration[7.0]
  def change
    add_column :sightings, :alert_level, :integer
  end
end
