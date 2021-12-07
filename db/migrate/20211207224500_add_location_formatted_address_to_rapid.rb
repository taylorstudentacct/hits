class AddLocationFormattedAddressToRapid < ActiveRecord::Migration[6.0]
  def change
    add_column :rapids, :location_formatted_address, :string
  end
end
