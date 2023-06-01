class ReviewsController < ApplicationController
  before_action :set_plane, only: %i[new]

  def new
    @booking = Booking.where(plane: @plane).and(Booking.where(user: current_user)).first
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to plane_path(@booking.plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_plane
    @plane = Plane.find(params[:plane_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
