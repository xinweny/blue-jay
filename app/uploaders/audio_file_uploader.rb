class AudioFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'mp3'
end
