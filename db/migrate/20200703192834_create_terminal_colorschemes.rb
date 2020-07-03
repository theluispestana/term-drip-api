class CreateTerminalColorschemes < ActiveRecord::Migration[6.0]
  def change
    create_table :terminal_colorschemes do |t|
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
