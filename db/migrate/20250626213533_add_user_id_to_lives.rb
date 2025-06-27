class AddUserIdToLives < ActiveRecord::Migration[7.1]
  def change
    add_reference :lives, :user, null: false, foreign_key: true
  end
end
