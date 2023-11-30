class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:start_datetime).map {|datetime| datetime.to_date}.uniq.sort

    if params[:commit] == 'Search Flights' && valid_search_params?
      @flights = Flight.all

      @flights = @flights.where(departure_airport_id: params[:departure_airport]) if params[:departure_airport].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport]) if params[:arrival_airport].present?
      @flights = @flights.where("DATE(start_datetime) = ?", params[:flight_date]) if params[:flight_date].present?
      @flights = @flights.order(start_datetime: :asc)
    else
      @flights = []
    end

    @passenger_count = params[:passenger_count]
  end

  private
  
  def valid_search_params?
    %i[departure_airport arrival_airport flight_date].any? {|param| params[param].present?} && params[:passenger_count].to_i.positive?
  end
end

