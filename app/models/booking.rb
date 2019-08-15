class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: %i[pending accepted rejected]

  def total_price
    format('%.2f', (event_end - event_start) * band.price / 3600)
  end
end
