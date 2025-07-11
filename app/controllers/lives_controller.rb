class LivesController < ApplicationController
  before_action :is_host?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lives = Life.where(user_id: current_user.id)
  end

  def show
    @life = Life.find(params[:id])
    @reviews = @life.reviews
    @booking = Booking.new()
    @reviews = @life.reviews.includes(:user).order(created_at: :desc)
  end

  def new
    @life = Life.new()
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    if @life.save
      redirect_to life_path(@life), notice: "Life created successfully."
      unless current_user.is_host
      current_user.update(is_host: true)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @life = Life.find(params[:id])
  end

  def update
    @life = Life.find(params[:id])
    if @life.update(life_params)
      redirect_to life_path(@life), notice: "Life updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @life = Life.find(params[:id])
    @life.destroy

    redirect_to lives_path
  end

  private

  def life_params
    params.require(:life).permit(:title, :description_short, :description_long, :address, :price_per_day, :status, images: [])
  end

  def is_host?
    current_user.is_host
  end


end
