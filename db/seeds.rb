# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear the tables
Country.destroy_all
City.destroy_all

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
