class BookingsController < ApplicationController
    def new
        @selected_flight = Flight.find(params[:selected_flight_id])
        @num_passengers = params[:passenger_count].to_i
    end
end
