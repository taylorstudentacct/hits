class AddPictureCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pictures_count, :integer
  end
end
