class Booking < ApplicationRecord
    belongs_to :flight
    # belongs_to :passenger

    # has_many :passengers

    has_many :booking_passengers, class_name: 'BookingPassenger'
    has_many :passengers, through: :booking_passengers

    accepts_nested_attributes_for :passengers

end
