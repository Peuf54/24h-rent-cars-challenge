class BookingsController < ApplicationController
    def create
        booking = Booking.new(booking_params)
        car = Car.find(params[:car_id])
        booking.car = car
        booking.user = current_user

        if booking.save
            redirect_to car_path(car), notice: "Booking successfully requested !"
        else
            redirect_to car_path(car), alert: "An error has occured with selected dates"
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:starts_at, :ends_at)
    end
end
