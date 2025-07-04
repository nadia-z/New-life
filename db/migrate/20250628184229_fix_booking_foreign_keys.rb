class FixBookingForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookings, :users
    remove_foreign_key :bookings, :lives

    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :lives
  end
end
