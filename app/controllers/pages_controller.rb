class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end

private

def customer_params
  params.require(:page).permit(:model, :pax_capacity, :fh_price, :fh_range, :location, :user_id)
end
