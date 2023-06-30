class Country < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, length: { is: 3 }

  has_many :cities
end