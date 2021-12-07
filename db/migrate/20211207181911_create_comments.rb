class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :picture_id
      t.text :text
      t.integer :created_by

      t.timestamps
    end
  end
end
