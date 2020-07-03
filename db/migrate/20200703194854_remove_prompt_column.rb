class RemovePromptColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :prompts, :name
  end
end
