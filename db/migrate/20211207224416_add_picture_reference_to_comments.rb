class AddPictureReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :pictures
    add_index :comments, :picture_id
    change_column_null :comments, :picture_id, false
  end
end
