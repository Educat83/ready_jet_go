class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plane, only: %i[show update]

  def index
    @planes = Plane.all
  end

  def show; end

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
    before_action :authenticate_user!
    set_plane
  end

  def update
    if @plane.update(plane_params)
      redirect_to plane_path(@plane), notice: "#{@plane.model} was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:model, :pax_capacity, :fh_price, :fh_range, :location, :user_id)
  end
end
