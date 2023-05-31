class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new crate edit update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
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

  def edit; end

  def update
    if @pbooking.update(booking_params)
      redirect_to booking_path(@booking), notice: "#{@booking.id} was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_booking
    @plane = Plane.find(params[:plane_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :total_hours, :total_price)
  end
end
