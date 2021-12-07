class AddFriend2ReferenceToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friendships, :users, column: :friend2_id
    add_index :friendships, :friend2_id
    change_column_null :friendships, :friend2_id, false
  end
end
