class CreateLives < ActiveRecord::Migration[7.1]
  def change
    create_table :lives do |t|
      t.string :title
      t.string :description
      t.string :address
      t.float :price_per_day
      t.string :category
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
