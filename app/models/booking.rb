class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum status: %i[pending accepted rejected]

  def total_price
    format('%.2f', (event_end - event_start) * band.price / 3600)
  end
end
