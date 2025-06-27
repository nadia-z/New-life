class AddDetailsToLives < ActiveRecord::Migration[7.1]
  def change
    add_column :lives, :title, :string
    add_column :lives, :description, :string
    add_column :lives, :address, :string
    add_column :lives, :price_per_day, :float
    add_column :lives, :status, :string
  end
end
