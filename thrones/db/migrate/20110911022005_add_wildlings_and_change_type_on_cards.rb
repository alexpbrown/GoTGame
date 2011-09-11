class AddWildlingsAndChangeTypeOnCards < ActiveRecord::Migration
  def up
    rename_column :cards, :card_type, :type
    add_column :cards, :wildlings, :boolean
  end

  def down
    rename_column :cards, :type, :card_type
    remove_column :cards, :wildlings
  end
end
