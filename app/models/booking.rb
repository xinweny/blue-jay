class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true
  validates :event_start, presence: true
  validates :event_end, presence: true

  enum status: %i[pending accepted rejected]

  def total_price
    format('%.2f', (event_end - event_start) * band.price / 3600)
  end

  def time_start
    event_start.strftime("%H:%M, %a %-d %b %Y")
  end

  def time_end
    event_end.strftime("%H:%M, %a %-d %b %Y")
  end
end
