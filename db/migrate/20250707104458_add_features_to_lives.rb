class AddFeaturesToLives < ActiveRecord::Migration[7.0]
  def change
    add_column :lives, :features, :string, array: true, default: []
  end
end
