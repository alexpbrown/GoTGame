class RemoveIsThroneFromTerritories < ActiveRecord::Migration
  def up
    remove_column :territories, :is_throne
  end

  def down
    add_column :territories, :is_throne, :boolean
  end
end
