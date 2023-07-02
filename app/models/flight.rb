class Flight < ApplicationRecord
  validates :departure_date, presence: true
  validates :duration, presence: true

  belongs_to :airport_from, class_name: "Airport"
  belongs_to :airport_to, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings
end
