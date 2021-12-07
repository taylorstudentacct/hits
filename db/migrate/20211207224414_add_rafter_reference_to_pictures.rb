class AddRafterReferenceToPictures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pictures, :users, column: :uploaded_by
    add_index :pictures, :uploaded_by
    change_column_null :pictures, :uploaded_by, false
  end
end
