class AddImagesToLife < ActiveRecord::Migration[7.1]
  def change
    add_column :lives, :images, :string
  end
end
