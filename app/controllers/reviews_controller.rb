class ReviewsController < ApplicationController
  before_action :set_band

  def create
    @review = Review.new(review_params)
    @booking = Booking.new
    @review.band = @band
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to band_path(@band)
    else
      render 'bands/show'
    end
  end

  private

  def set_band
    @band = Band.find(params[:band_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
