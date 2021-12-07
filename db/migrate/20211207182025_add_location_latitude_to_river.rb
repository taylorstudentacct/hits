class AddLocationLatitudeToRiver < ActiveRecord::Migration[6.0]
  def change
    add_column :rivers, :location_latitude, :float
  end
end
