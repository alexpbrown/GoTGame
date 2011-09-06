class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.string :name
      t.integer :type
      t.integer :crowns
      t.integer :barrels
      t.integer :mustering
      t.integer :househome

      t.timestamps
    end
  end
end
