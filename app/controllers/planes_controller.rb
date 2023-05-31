class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
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
    before_action :authenticate_user!
    @plane = Plane.find(params[:id])
  end

  def update
    @plane = Plane.find(params[:id])
    if @plane.update(plane_params)
      rredirect_to plane_path(@plane), notice: "#{@plane.model} was successfully updated."
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

  def plane_params
    params.require(:plane).permit(:model, :pax_capacity, :fh_price, :fh_range, :location, :user_id)
  end
end
