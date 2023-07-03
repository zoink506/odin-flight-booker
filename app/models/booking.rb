class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy

  validates :flight_id, presence: true

  accepts_nested_attributes_for :passengers
end