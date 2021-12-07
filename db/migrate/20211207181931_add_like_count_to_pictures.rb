class AddLikeCountToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :likes_count, :integer
  end
end
