class Airport < ApplicationRecord
  validates :name, presence: true
  belongs_to :city
end