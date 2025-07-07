class RemoveDescriptionFromLives < ActiveRecord::Migration[7.1]
  def change
    remove_column :lives, :description, :string
  end
end
