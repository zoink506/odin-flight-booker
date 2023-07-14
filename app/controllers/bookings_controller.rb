class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_of_passengers = params[:passengers].to_i
    @booking = @flight.bookings.build
    4.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(flight_id: params[:booking][:flight_id])
    if !@booking.save
      flash[:alert] = "Something went wrong and the booking couldn't be saved"
      redirect_to root_path and return
    end

    p @booking
    p params[:booking][:passengers_attributes]
    passengers = params[:booking][:passengers_attributes]

    passengers.each do |p|
      p p[1][:name]
      p p[1][:email]
      pass = @booking.passengers.build(name: p[1][:name], email: p[1][:email])

      if !pass.save
        @booking.destroy

        flash[:alert] = "Something went wrong and the passenger couldn't be saved"
        redirect_to root_path and return
      end

    end
    # remember to save the passengers also

    flash[:notice] = "Thanks for booking with our airline"
    render :show, status: :created
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
    end
end
