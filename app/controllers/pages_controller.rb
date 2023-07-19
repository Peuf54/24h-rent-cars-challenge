class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # Get the last 3 cars for the home page
    @cars = Car.order("created_at").limit(3)
  end
end
