class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @plane = Plane.find(params[:plane_id])
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new(booking_params)
    @booking.total_price = booking_params["total_hours"] * @plane.fh_price
    @booking.user_id = current_user.id
    @booking.plane_id = @plane.id
    if @booking.save
      redirect_to plane_bookings_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :total_hours, :total_price)
  end
end
