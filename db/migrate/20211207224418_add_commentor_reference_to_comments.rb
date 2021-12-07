class AddCommentorReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :users, column: :created_by
    add_index :comments, :created_by
    change_column_null :comments, :created_by, false
  end
end
