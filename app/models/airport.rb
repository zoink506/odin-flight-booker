class Airport < ApplicationRecord
  validates :name, presence: true

  belongs_to :city
  has_many :departing_flights, foreign_key: "airport_from_id", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "airport_to_id", class_name: "Flight"
end
