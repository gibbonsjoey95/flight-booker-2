class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @selected_flight = Flight.find(params[:selected_flight_id])

        @num_passengers = params[:passenger_count].to_i
        @num_passengers.times { @booking.passengers.build }

    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            redirect_to '/bookings/show', notice: 'Booking was created.'
        else
            render :new
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:selected_flight_id, passengers_attributes: [:name, :email])
    end
end
