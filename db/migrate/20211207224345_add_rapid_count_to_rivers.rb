class AddRapidCountToRivers < ActiveRecord::Migration[6.0]
  def change
    add_column :rivers, :rapids_count, :integer
  end
end
