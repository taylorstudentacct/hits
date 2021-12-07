class AddLocationFormattedAddressToRiver < ActiveRecord::Migration[6.0]
  def change
    add_column :rivers, :location_formatted_address, :string
  end
end
