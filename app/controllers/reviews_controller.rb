class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_life_and_booking
  before_action :check_booking_date, only: [:new, :create]
  before_action :check_user_has_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.life = @life
    @review.user = current_user
    if @review.save
      redirect_to life_path(@life), notice: "Review posted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_life_and_booking
    @life = Life.find(params[:life_id])
    @booking = Booking.find(params[:booking_id]) if params[:booking_id].present?
  end

  def check_booking_date
    return redirect_to life_booking_path(@life, @booking), alert: "Booking not found." if @booking.nil?

    # Use end_date to check if booking is finished
    if @booking.end_date >= Date.today
      redirect_to life_booking_path(@life, @booking), alert: "You can only leave a review after your booking end date."
    end
  end



  def check_user_has_booking
    unless current_user.bookings.exists?(id: @booking.id)
      redirect_to life_booking_path(@life, @booking), alert: "You need to have this booking to leave a review."
    end
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
