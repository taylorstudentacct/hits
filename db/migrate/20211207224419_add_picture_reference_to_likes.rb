class AddPictureReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :pictures
    add_index :likes, :picture_id
    change_column_null :likes, :picture_id, false
  end
end
