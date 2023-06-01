class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plane, only: %i[show update]

  def index
    @planes = Plane.all
    @planes = Plane.left_outer_joins(:bookings).where('planes.id NOT IN (SELECT DISTINCT plane_id FROM bookings WHERE date = ?)', params[:date])
    @planes = @planes.where('pax_capacity >= ?', params[:passenger_count].to_i)
  end

  def show
    @booking = Booking.new
    @plane_reviews = Booking.where(plane: @plane)
  end

  def new
    @plane = Plane.new
    @plane.user_id = current_user.id
  end

  def create
    @plane = Plane.new(plane_params)
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_plane
  end

  def update
    if @plane.update(plane_params)
      redirect_to plane_path(@plane), notice: "#{@plane.model} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @plane = Plane.find(params[:id])
    @plane.destroy
    redirect_to planes_path, notice: 'Plane was successfully deleted.', status: :see_other
  end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:model, :pax_capacity, :fh_price, :photo, :fh_range, :location, :user_id)
  end
end
