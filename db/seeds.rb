# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'date'

User.destroy_all

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

# CREATION OF 5 USERS
puts "----- CREATION OF 5 USERS -----"

User.create({email: "test@test.com", password: "password"})
User.create({email: "test2@test.com", password: "password"})
User.create({email: "test3@test.com", password: "password"})
User.create({email: "test4@test.com", password: "password"})
User.create({email: "test5@test.com", password: "password"})

# END OF CREATION OF 5 USERS
puts "----- END OF CREATION OF 5 USERS -----"




# CREATION OF 15 CARS
puts "----- CREATION OF 15 CARS -----"

15.times do
    car = Car.new({brand: Faker::Vehicle.make, model: Faker::Vehicle.model, year_of_production: Faker::Vehicle.year, address: ADDRESSES.sample, price_per_day: rand(50..350)})
    car.user = User.all.reject { |user| user.cars.count > 5 }.sample
    car.save!
end

# END OF CREATION OF 15 CARS
puts "----- END OF CREATION OF 15 CARS -----"

# Let's assume each booking lasts for 2 days




# CREATION OF 25 BOOKINGS
puts "----- CREATION OF 25 BOOKINGS -----"

25.times do
    duration = rand(1..5).to_i

    car = Car.all.sample
    existing_bookings = car.bookings.order(:starts_at)
    start_date = Date.today

    existing_bookings.each do |booking|
    # If start_date does not conflict with the booking, break the loop
    break unless start_date >= booking.starts_at && start_date < booking.ends_at

    start_date = booking.ends_at + 1
    end
    end_date = start_date + duration.days

    new_booking = Booking.new({
    car: car,
    starts_at: start_date,
    ends_at: end_date
    })

    new_booking.user = User.all.reject { |user| new_booking.car.user == user }.reject { |user| user.bookings.count > 5 }.sample
    new_booking.save!
end

# END OF CREATION OF 25 BOOKINGS
puts "----- END OF CREATION OF 25 BOOKINGS -----"