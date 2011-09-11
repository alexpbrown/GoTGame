class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :descriptor
      t.integer :card_type
      t.string :image_path

      t.timestamps
    end
  end
end
