# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear the tables
# Tables must be cleared in order of dependent foreign keys or error is thrown
Flight.destroy_all
Airport.destroy_all
City.destroy_all
Country.destroy_all

# Create countries of ten most visited airports in the world
Country.create([
  { name: "United States of America",
    code: "USA" },
  { name: "United Arab Emirates",
    code: "ARE" },
  { name: "Turkey",
    code: "TUR" },
  { name: "United Kingdom",
    code: "GBR" },
  { name: "France",
    code: "FRA" },
  { name: "India",
    code: "IND" }
])

# Create cities for ten most visited airports in the world
City.create([
  { name: "Atlanta",
    country_id: Country.find_by(code: "USA").id },
  { name: "Dallas",
    country_id: Country.find_by(code: "USA").id },
  { name: "Denver",
    country_id: Country.find_by(code: "USA").id },
  { name: "Chicago",
    country_id: Country.find_by(code: "USA").id },
  { name: "Al Garhoud",
    country_id: Country.find_by(code: "ARE").id },
  { name: "Los Angeles",
    country_id: Country.find_by(code: "USA").id },
  { name: "Arnavutköy",
    country_id: Country.find_by(code: "TUR").id },
  { name: "Hillingdon",
    country_id: Country.find_by(code: "GBR").id },
  { name: "Roissy-en-France",
    country_id: Country.find_by(code: "FRA").id },
  { name: "Delhi",
    country_id: Country.find_by(code: "IND").id }
])

Airport.create([
  { name: "Hartsfield–Jackson Atlanta International Airport",
    city_id: City.find_by(name: "Atlanta").id },
  { name: "Dallas Fort Worth International Airport",
    city_id: City.find_by(name: "Dallas").id },
  { name: "Denver International Airport",
    city_id: City.find_by(name: "Denver").id },
  { name: "O'Hare International Airport",
    city_id: City.find_by(name: "Chicago").id },
  { name: "Dubai International Airport",
    city_id: City.find_by(name: "Al Garhoud").id },
  { name: "Los Angeles International Airport",
    city_id: City.find_by(name: "Los Angeles").id },
  { name: "Istanbul Airport",
    city_id: City.find_by(name: "Arnavutköy").id },
  { name: "Heathrow Airport",
    city_id: City.find_by(name: "Hillingdon").id },
  { name: "Charles de Gaulle Airport",
    city_id: City.find_by(name: "Roissy-en-France").id },
  { name: "Indira Gandhi International Airport",
    city_id: City.find_by(name: "Delhi").id }
])

# Create a flight from every airport to every other airport, for every day in June

airports = Airport.all
airports.each do |first_airport|
  airports.each do |second_airport|
    if first_airport != second_airport
      day = 1
      year = 2023
      month = 6

      while(day < 30)
        2.times do
          hour = rand(23)
          minute = rand(59)
          second = 0
          dur = 60 * rand(1..16)

          Flight.create(
            airport_from: first_airport,
            airport_to: second_airport,
            departure_date: DateTime.new(year, month, day, hour, minute, second),
            duration: dur
          )
        end

        day += 1
      end
    end
  end
end
