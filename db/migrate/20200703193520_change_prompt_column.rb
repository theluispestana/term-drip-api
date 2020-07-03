class ChangePromptColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :prompts, :user_id, :theme_id
  end
end
