class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  acts_as_taggable_on :tags
  ActsAsTaggableOn.force_lowercase = true

  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioFileUploader

  validates :name, presence: true
  validates :jazz_type, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  include PgSearch
  pg_search_scope :search_by_name_type_description,
                  against: { name: 'A',
                             jazz_type: 'B',
                             description: 'C' },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  def average_rating
    return 0 if reviews.empty?

    rating = 0

    reviews.each { |review| rating += review.rating }
    (rating.to_f / reviews.length).round(2)
  end

  def youtube_url
    video_url.gsub('https://www.youtube.com/', 'https://www.youtube.com/embed/')
  end
end
