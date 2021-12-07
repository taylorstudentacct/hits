class AddPictureCountToRapids < ActiveRecord::Migration[6.0]
  def change
    add_column :rapids, :pictures_count, :integer
  end
end
