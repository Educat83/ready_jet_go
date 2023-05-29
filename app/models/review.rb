class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :rating, presence: true
end
