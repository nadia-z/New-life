class FixBookingForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookings, :users
    remove_foreign_key :bookings, :lives

    rename_column :bookings, :users_id, :user_id
    rename_column :bookings, :lives_id, :life_id

    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :lives
  end
end
