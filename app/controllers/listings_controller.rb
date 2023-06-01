class ListingsController < ApplicationController
  def index
    @planes = Plane.where(user_id: current_user)
  end
end
