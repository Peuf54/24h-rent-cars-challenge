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
        dates = []
        car.bookings.each do |booking|
            dates << { from: booking.starts_at, to: booking.ends_at }
        end
        dates
    end
end
