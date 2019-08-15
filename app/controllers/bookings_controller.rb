class BookingsController < ApplicationController
  before_action :set_band, only: %i[new create edit]
  before_action :set_booking, only: %i[show edit update]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @markers = [{
            lat: @booking.latitude,
            lng: @booking.longitude,
            infoWindow: render_to_string(partial: 'info_window', locals: { booking: @booking })
          }]
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.band = @band
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def set_band
    @band = Band.find(params[:band_id])
    authorize @band
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:address, :description, :event_start, :event_end, :status, :latitude, :longitude)
  end
end
