class Passenger < ApplicationRecord
    # belongs_to :booking
    
    # has_many :bookings
    # has_many :flights, through: :bookings

    has_many :booking_passengers, class_name: 'BookingPassenger'
    has_many :bookings, through: :booking_passengers
end
