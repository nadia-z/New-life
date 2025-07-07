class AddDescriptionLongToLives < ActiveRecord::Migration[7.1]
  def change
    add_column :lives, :description_long, :string
  end
end
