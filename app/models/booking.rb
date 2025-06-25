class Booking < ApplicationRecord
  belongs_to :lives
  belongs_to :users
end
