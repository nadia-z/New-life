class RemoveCategoryFromLives < ActiveRecord::Migration[7.1]
  def change
    remove_column :lives, :category
  end
end
