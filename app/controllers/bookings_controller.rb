class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: user_id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.new
  end

  def create
    @property = Property.find(params[:property_id])
    @booking = @property.bookings.new(booking_params)
    @booking.user_id = user_id
    if @booking.save
      redirect_to @property
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
