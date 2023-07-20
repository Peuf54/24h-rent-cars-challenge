# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'date'
require "open-uri"

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

IMAGES_URL = [
    "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1080&q=80",
    "https://images.unsplash.com/photo-1494697536454-6f39e2cc972d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80",
    "https://images.unsplash.com/photo-1441148345475-03a2e82f9719?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1523983302122-73e869e1f850?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1541443131876-44b03de101c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1522813592722-0650544ffe03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1641423377188-b6f67e0cd781?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80",
    "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1630945688515-306cc4e59977?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80",
    "https://images.unsplash.com/photo-1584345604476-8ec5e12e42dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1603386329225-868f9b1ee6c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80",
    "https://images.unsplash.com/photo-1592853625601-bb9d23da12fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1588258219511-64eb629cb833?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1562911791-c7a97b729ec5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1237&q=80"
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

i = 0

15.times do
    car = Car.new({brand: Faker::Vehicle.make, model: Faker::Vehicle.model, year_of_production: Faker::Vehicle.year, address: ADDRESSES.sample, price_per_day: rand(50..350)})
    car.user = User.all.reject { |user| user.cars.count > 5 }.sample

    file = URI.open(IMAGES_URL.shuffle.pop)
    car.photo.attach(io: file, filename: "#{i}.png", content_type: "image/png")

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