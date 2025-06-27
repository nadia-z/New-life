class LivesController < ApplicationController
  def index
  end

  def show
    #@life = Life.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    #@life = Life.find(params[:id])
  end

  def update

  end

  def destroy
    life = Life.find(params[:id])
    life.destroy
  end

  private


end
