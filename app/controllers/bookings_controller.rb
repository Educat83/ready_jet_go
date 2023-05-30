class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end
end
