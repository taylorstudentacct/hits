class AddLikerReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :users, column: :liked_by
    add_index :likes, :liked_by
    change_column_null :likes, :liked_by, false
  end
end
