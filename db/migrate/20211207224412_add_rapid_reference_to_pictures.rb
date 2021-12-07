class AddRapidReferenceToPictures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pictures, :rapids
    add_index :pictures, :rapid_id
    change_column_null :pictures, :rapid_id, false
  end
end
