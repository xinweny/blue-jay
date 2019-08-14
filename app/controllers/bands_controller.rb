class BandsController < ApplicationController
  before_action :set_band, only: %i[show]

  def index
    @bands = policy_scope(Band)
  end

  def show
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

  def set_band
    @band = Band.find(params[:id])
    authorize @band
  end
end
