# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

ADDRESSES = [
    '33 Rue des Deux Ponts, 75004, Paris',
    'Route de Sevres a Neuilly, 75004, Paris',
    '33 Rue des Deux Ponts, 75016, Paris',
    '12 Rue Saint-Bernard, 75004, Paris',
    '34 Bis Rue de Dunkerque, 75010, Paris',
    '48 Rue de la Folie Mericourt, 75011, Paris',
    '39 Rue Joubert, 75009, Paris',
    '330 Avenue George V, 75008, Paris',
    '65 Rue de Lyon, 75012, Paris',
    '91 Avenue des Champs-Elysees, 75008, Paris',
]

15.times do
    car = Car.new({brand: Faker::Vehicle.make, model: Faker::Vehicle.model, year_of_production: Faker::Vehicle.year, address: ADDRESSES.sample, price_per_day: rand(50..350)})
    car.user = User.last
    car.save!
end