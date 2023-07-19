class CarsController < ApplicationController
    def index
        @cars = Car.all    
    end

    def show
        @car = Car.find(params[:id])
        @booking = Booking.new
    end

    def new
        @car = Car.new
    end

    def create
        
    end
end
