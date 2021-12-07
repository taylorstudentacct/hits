class CreateRapids < ActiveRecord::Migration[6.0]
  def change
    create_table :rapids do |t|
      t.string :name
      t.integer :river_id
      t.string :location
      t.string :description
      t.integer :difficulty

      t.timestamps
    end
  end
end
