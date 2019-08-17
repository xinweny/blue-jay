class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @bands = policy_scope(Band).search_by_name_type_description(params[:query])
    else
      @bands = policy_scope(Band)
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new(band: @band)
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

  def edit
  end

  def update
    @band.update(band_params)
    if @band.save
      redirect_to band_path(@band)
    else
      render :edit
    end
  end

  def destroy
    @band.destroy
    redirect_to my_bands_path
  end

  def my_bands
    @bands = Band.where(user: current_user)
    authorize @bands
  end

  def tagged
    if params[:tag].present?
      @bands = Band.tagged_with(params[:tag])
      authorize @bands
    else
      @bands = Band.all
      authorize @bands
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :description, :jazz_type, :price, :image, :video_url, :audio, :tag_list)
  end

  def set_band
    @band = Band.find(params[:id])
    authorize @band
  end
end
