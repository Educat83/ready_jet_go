class ReviewsController < ApplicationController
  before_action :set_plane, only: %i[new create]

  def new
    @plane = Plane.find(params[:plane_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.plane = @plane
    if @review.save
      redirect_to plane_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to plane_path(@review.plane), status: :see_other
  end

  private

  def set_plane
    @plane = Plane.find(params[:plane_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
