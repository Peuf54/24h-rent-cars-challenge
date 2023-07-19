class CarsController < ApplicationController
    def index
        @cars = Car.all    
    end

    def show
        @car = Car.find(params[:id])
        @booking = Booking.new

        @unavailable_dates = getUnavailableDates(@car).to_json
    end

    def new
        @car = Car.new
    end

    def create
        
    end

    private

    def getUnavailableDates(car)
        # Statement of the empty array where unavailables dates for a car will be placed
        dates = []
        car.bookings.each do |booking|
            # Pushing unavailables dates during the iteration into every bookings of a car
            dates << { from: booking.starts_at, to: booking.ends_at }
        end
        dates
    end
end
