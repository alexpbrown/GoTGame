class ChangeHousehomeTypeInTerritories < ActiveRecord::Migration
  def up
    change_column :territories, :househome, :string
  end

  def down
    change_column :territories, :househome, :integer
  end
end
