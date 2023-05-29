class Plane < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :pax_capacity, :fh_price, :fh_range, :model, :location, presence: true
end
