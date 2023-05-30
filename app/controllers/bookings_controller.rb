class BookingsController < ApplicationController
  def new
    @booking = Booking.all
  end
end
