class BookingsController < ApplicationController
 before_action :set_life
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new()
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.life_id = @life.id

    if @booking.start_date && @booking.end_date
      days = (@booking.end_date - @booking.start_date).to_i + 1
      @booking.total_price = @life.price_per_day * days
    end

    if @booking.save
      redirect_to life_booking_path(@life, @booking)
    else
			render :new, status: :unprocessable_entity
	  end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @life = Life.find(params[:life_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to life_booking_path(@life, @booking)
  end

  def destroy
    @life = Life.find(params[:life_id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to life_bookings_path(@life, @booking), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
