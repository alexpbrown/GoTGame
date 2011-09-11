class ChangeTypeTypeInCards < ActiveRecord::Migration
  def up
    change_column :cards, :type, :string
  end

  def down
    change_column :cards, :type, :integer
  end
end
