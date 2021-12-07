class CreateRivers < ActiveRecord::Migration[6.0]
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :location
      t.string :description
      t.integer :classrange

      t.timestamps
    end
  end
end
