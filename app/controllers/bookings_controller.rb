class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_of_passengers = params[:passengers]
    
  end
end