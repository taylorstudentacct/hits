class AddCommentCountToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :comments_count, :integer
  end
end
