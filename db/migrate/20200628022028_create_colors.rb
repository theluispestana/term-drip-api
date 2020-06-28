class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :color
      t.string :color_type
      t.integer :colorable_id
      t.string :colorable_type

      t.timestamps
    end
  end
end
