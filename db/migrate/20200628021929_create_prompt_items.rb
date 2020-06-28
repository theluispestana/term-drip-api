class CreatePromptItems < ActiveRecord::Migration[6.0]
  def change
    create_table :prompt_items do |t|
      t.string :prompt_type
      t.integer :order
      t.references :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
