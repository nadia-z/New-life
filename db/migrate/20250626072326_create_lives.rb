class CreateLives < ActiveRecord::Migration[7.1]
  def change
    create_table :lives do |t|
      t.string :category

      t.timestamps
    end
  end
end
