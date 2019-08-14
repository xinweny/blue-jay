class BandsController < ApplicationController
  def index
    @bands = Bands.all
    authorize @bands
  end

  def new
    @band = Band.new
    authorize @band
  end

  def create
    @band = Band.new(band_params)
    authorize @band
    @band.user = current_user
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :description, :price)
  end
end
