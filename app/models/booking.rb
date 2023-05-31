class Booking < ApplicationRecord
  scope :available_on_date, ->(date) { where('booking_date = ?', date) }
  belongs_to :user
  belongs_to :plane
  has_many :reviews

  validates :total_hours, :total_price, :date, presence: true
  validates :total_hours, numericality: { only_float: true }
  validates :total_price, numericality: { only_float: true }
  validate :total_hours_greater_than_one
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "Booking date can't be in the past!") if date.past?
  end

  def total_hours_greater_than_one
    errors.add(:total_hours, "The minimum flight is one hour!") if total_hours < 1.0
  end
end
