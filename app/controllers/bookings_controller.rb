class BookingsController < ApplicationController
  before_action :set_life, except: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new()
  end

  def show
    @days = (@booking.end_date - @booking.start_date).to_i + 1
    @review = Review.new
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
  end

  def update
    if @booking.update(booking_params)
      days = (@booking.end_date - @booking.start_date).to_i + 1
      @booking.update(total_price: @life.price_per_day * days)
      redirect_to life_booking_path(@life, @booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to life_bookings_path(@life), status: :see_other
  end

  private

  def set_life
    @life = Life.find(params[:life_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
