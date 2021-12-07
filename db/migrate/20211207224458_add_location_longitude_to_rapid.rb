class AddLocationLongitudeToRapid < ActiveRecord::Migration[6.0]
  def change
    add_column :rapids, :location_longitude, :float
  end
end
