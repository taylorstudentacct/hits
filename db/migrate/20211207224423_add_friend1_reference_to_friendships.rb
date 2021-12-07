class AddFriend1ReferenceToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friendships, :users, column: :friend1_id
    add_index :friendships, :friend1_id
    change_column_null :friendships, :friend1_id, false
  end
end
