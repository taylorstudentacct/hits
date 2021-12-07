class AddRiverReferenceToRapids < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rapids, :rivers
    add_index :rapids, :river_id
    change_column_null :rapids, :river_id, false
  end
end
