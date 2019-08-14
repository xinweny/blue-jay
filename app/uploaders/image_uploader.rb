class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true
  process convert: 'jpg'

  version :avatar do
    resize_to_fit 50, 50
  end
end
