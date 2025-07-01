class AddDescriptionShortToLives < ActiveRecord::Migration[7.1]
  def change
    add_column :lives, :description_short, :string
  end
end
