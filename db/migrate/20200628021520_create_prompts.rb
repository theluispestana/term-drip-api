class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.string :name
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
