class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.string :name #name of the territory
      t.integer :territory_type #whether it is land (1), sea (2), or port (3)
      t.integer :crowns #number of crowns on the territory
      t.integer :supply #number of barrels on the territory
      t.integer :mustering_points #if a city or fortication, number of mustering points provided
      t.boolean :is_throne #whether the territory counts as a throne or not
      t.integer :househome #territory owned by a house by default

      t.timestamps
    end
  end
end
