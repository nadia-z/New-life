class LivesController < ApplicationController
  def index
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
  end

  def create
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



end
