class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :lives, through: :bookings, dependent: :destroy
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
