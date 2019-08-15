class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioFileUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
