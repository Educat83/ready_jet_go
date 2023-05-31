class BookingsController < ApplicationController
  # before_action :set_booking, only: %i[index new create edit update]

  def index
    @bookings = Booking.all
  end

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new(booking_params)
    @booking.total_price = booking_params["total_hours"].to_i * @plane.fh_price
    @booking.user = current_user
    @booking.plane = @plane
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path(@booking), notice: "#{@booking.id} was successfully updated."
    else
      render :edit
    end
  end

  private

  # def set_booking
  #   @plane = Plane.find(params[:plane_id])
  # end

  def booking_params
    params.require(:booking).permit(:date, :total_hours, :total_price)
  end
end
