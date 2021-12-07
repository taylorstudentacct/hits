class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :picture_id
      t.integer :liked_by

      t.timestamps
    end
  end
end
