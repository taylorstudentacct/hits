class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.integer :rapid_id
      t.integer :uploaded_by
      t.string :picture

      t.timestamps
    end
  end
end
