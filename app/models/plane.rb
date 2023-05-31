class Plane < ApplicationRecord
  attribute :image, :string
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :pax_capacity, :fh_price, :fh_range, :model, :location, presence: true
  validates :pax_capacity, numericality: { only_integer: true }
  validates :fh_price, numericality: { only_float: true }
  validates :fh_range, numericality: { only_float: true }
end
