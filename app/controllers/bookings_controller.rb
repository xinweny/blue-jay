class BookingsController < ApplicationController
  private

  def booking_params
    params.require(:booking).permit(:address, :description, :event_start, :event_end)
  end
end
