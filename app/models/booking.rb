class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plane
  has_many :reviews
  validates :total_hours, :total_price, :date, presence: true
end
