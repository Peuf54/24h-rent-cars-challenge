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

    def index
        @my_bookings = formatMyBooking(Booking.where(user_id: current_user.id))
        bookings_for_my_cars = []
        current_user.cars.each do |car|
            # Get every bookings, unless where accepted == true
            car.bookings.each { |booking| bookings_for_my_cars << booking unless booking.accepted }
        end
        @my_cars_bookings = formatMyCarsBooking(bookings_for_my_cars)
    end

    def acceptBooking
        booking = Booking.find(params[:id])
        booking.accepted = true
        if booking.save
            redirect_to bookings_path, notice: "Booking successfully accepted !"
        else
            redirect_to bookings_path, alert: "An error has occured."
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:starts_at, :ends_at)
    end

    def formatMyBooking(bookings)
        # Format the booking to get booking details, status 'accepted' or 'pending' and the class directly in the hash
        # To avoid logic in the view
        bookings.map { |booking| {details: booking, status: bookingStatusMessage(booking), total_price: getTotalPrice(booking)} }
    end

    def formatMyCarsBooking(bookings)
        # Format the booking to get booking details, status 'accepted' or 'pending' and the class directly in the hash
        # To avoid logic in the view
        bookings.map { |booking| {details: booking, total_price: getTotalPrice(booking)} }
    end

    def getTotalPrice(booking)
        # Return the total price of the booking
        bookings_duration_seconds = (booking.ends_at - booking.starts_at)
        bookings_duration_hours = (bookings_duration_seconds / 3600)
        bookings_duration_days = (bookings_duration_hours / 24)
        (booking.car.price_per_day * (bookings_duration_days)).round
    end

    def bookingStatusMessage(booking)
        # Format the :status value to get th emessage to display in the cards, and the class we have to apply
        booking.accepted ? {message: 'accepted', class: 'status-accepted'} : {message: 'pending...', class: 'status-pending'}
    end
end
