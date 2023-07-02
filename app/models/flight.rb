class Flight < ApplicationRecord
  validates :departure_date, presence: true
  validates :duration, presence: true

  belongs_to :airport_from, class_name: "Airport"
  belongs_to :airport_to, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def radio_button_value
    "#{self.airport_from.name} -> #{self.airport_to.name} \n #{self.departure_date} \n #{self.duration / 60}"
  end
end
