class AddLocationLatitudeToRapid < ActiveRecord::Migration[6.0]
  def change
    add_column :rapids, :location_latitude, :float
  end
end
