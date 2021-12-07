class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :friend1_id
      t.integer :friend2_id

      t.timestamps
    end
  end
end
