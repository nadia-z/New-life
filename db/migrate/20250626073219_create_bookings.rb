class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :life, null: false, foreign_key: true
      t.float :total_price

      t.timestamps
    end
  end
end
