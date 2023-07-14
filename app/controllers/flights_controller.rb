class FlightsController < ApplicationController
  def index
    p params
    p params.has_key?("flight") # if true, query search results, if false, present search form
    @flights = nil

    if params.has_key?("flight")
      @passengers = params[:flight][:passengers]
      #@flights = Flight.where(
      #  airport_from: params[:flight][:airport_from],
      #  airport_to: params[:flight][:airport_to],
      #  "departure_date LIKE ?", params[:flight][:departure_date]
      #)

      p params[:flight][:departure_date]

      #p DateTime.parse(params[:flight][:departure_date])
      @flights = Flight.where(
        [
         "airport_from_id = ? AND
          airport_to_id = ?",
          params[:flight][:airport_from],
          params[:flight][:airport_to]
        ]
      )
      date = DateTime.strptime(params[:flight][:departure_date], "%m-%d-%y")

      @flights = @flights.select do |f|
        date2 = f.departure_date
        date.year == date2.year && date.month == date2.month && date.day == date2.day
      end
    end

    @airports = Airport.all.map { |a| [a.name, a.id] }
    @flight = Flight.new
    @dates = Flight.pluck(:departure_date).map { |d| d.strftime("%m-%d-%y") }.uniq.sort
  end
end
