class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum status: [:pending, :accepted, :rejected]
end
