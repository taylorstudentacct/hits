class AddLocationLongitudeToRiver < ActiveRecord::Migration[6.0]
  def change
    add_column :rivers, :location_longitude, :float
  end
end
