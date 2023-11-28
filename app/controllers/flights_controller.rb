class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all

    @flight_dates = Flight.pluck(:start_datetime).map {|datetime| datetime.to_date}.uniq.sort
    
    @flights = @flights.where(departure_airport_id: params[:departure_airport]) if params[:departure_airport].present?
    @flights = @flights.where(arrival_airport_id: params[:arrival_airport]) if params[:arrival_airport].present?
    @flights = @flights.where("DATE(start_datetime) = ?", params[:flight_date]) if params[:flight_date].present?
    @flights = @flights.order(start_datetime: :asc)
  end
end

