class PlanesController < ApplicationController
  def index
    @planes = Plane.all
  end
end
