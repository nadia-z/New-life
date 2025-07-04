class ReviewsController < ApplicationController
  before_action :check_reservation, only: [:new, :create]
  before_action :check_user_has_reservation, only: [:new, :create]
  before_action :authenticate_user!
  before_action :set_life

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

  def check_reservation
    unless current_user.reservations.exists?(life_id: @life.id)
      redirect_to life_path(@life), alert: "You can only leave a review if you’ve booked this life."
  end
end


  def set_life
    @life = Life.find(params[:life_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end


  def check_user_has_reservation
    unless current_user.reservations.exists?(life: @life)
    redirect_to life_path(@life), alert: "You need to reserve this life before leaving a review."
  end
end
