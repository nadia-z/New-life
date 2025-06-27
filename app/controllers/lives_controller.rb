class LivesController < ApplicationController
  before_action :is_host?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lives = Life.all
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
    @life = Life.new()
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    if @life.save
      redirect_to life_path(@life), notice: 'Life was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @life = Life.find(params[:id])
  end

  def update
    life = Life.find(params[:id])
    life.title = params[:title]
    life.description = params[:description]
    life.address = params[:address]
    life.price_per_day = params[:price_per_day]
    life.status = params[:status]
    life.save


    redirect_to life_path(params[:id])
  end

  def destroy
    life = Life.find(params[:id])
    life.destroy

    redirect_to lives_path
  end

  private

  def life_params
    params.require(:life).permit(:title, :description, :address, :price_per_day, :status)
  end

  def is_host?
    current_user.is_host
  end


end
