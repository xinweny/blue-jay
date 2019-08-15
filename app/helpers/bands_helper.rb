module BandsHelper
  def band_image(band)
    if band.image.present?
      band.image
    else
      image_url 'default_band_image.jpg'
    end
  end
end
