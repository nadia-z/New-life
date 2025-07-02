class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :life
  validates :status, inclusion: {in: ["available", "unavailable"]}
end
