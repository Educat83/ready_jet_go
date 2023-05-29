class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, length: { minumum: 10, message: "must be at least 10 characters long" }
end
