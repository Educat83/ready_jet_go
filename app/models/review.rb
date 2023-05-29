class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :rating, presence: true
  validates :rating, numericality: { in: 1.0..5.0 }
  validates :content, length: { minimum: 10, message: "must be at least 10 characters long" }
end
