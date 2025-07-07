class Life < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  has_many_attached :images
  has_many :reviews, dependent: :destroy

end
