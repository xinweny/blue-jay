class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :samples, presence: true
end
