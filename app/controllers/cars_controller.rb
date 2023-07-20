class CarsController < ApplicationController
    def index
        @cars = Car.all.reject { |car| car.user == current_user }
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
        car = Car.new(car_params)
        car.user = current_user
        if car.save
            redirect_to car_path(car), notice: 'Car successfully added !'
        else
            @car = Car.new
            redirect_to new_car_path, alert: 'An error has occured.'
        end
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

    def car_params
        params.require(:car).permit(:brand, :model, :year_of_production, :price_per_day, :address)
    end
end
