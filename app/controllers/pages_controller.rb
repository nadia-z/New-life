class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @lives = Life.all
  end

  def about
  end
end
