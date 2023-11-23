# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports_data = [
  { code: 'SFO', city: 'San Francisco' },
  { code: 'NYC', city: 'New York City' },
  { code: 'LAX', city: 'Los Angeles' },
  { code: 'ORD', city: 'Chicago' },
  { code: 'DFW', city: 'Dallas/Fort Worth' },
  { code: 'ATL', city: 'Atlanta' },
  { code: 'DEN', city: 'Denver' },
  { code: 'SEA', city: 'Seattle' },
  { code: 'MIA', city: 'Miami' },
  { code: 'LAS', city: 'Las Vegas' }
]

Airport.create(airports_data)

10.times do
  departure_airport = Airport.all.sample
  arrival_airport = (Airport.all - [departure_airport]).sample

  Flight.create(
    departure_airport_id: departure_airport.id,
    arrival_airport_id: arrival_airport.id,
    start_datetime: DateTime.now + rand(1..10).hours,
    flight_duration: rand(1..8) * 100 # Assuming flight duration is in hours
  )
end