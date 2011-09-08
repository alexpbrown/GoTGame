class CreateAdjacencies < ActiveRecord::Migration
  def change
    create_table :adjacencies do |t|
      t.integer :territory_id
      t.integer :adjacent_id
      t.integer :game_version

      t.timestamps
    end
  end
end
