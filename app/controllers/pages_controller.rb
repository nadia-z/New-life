class PagesController < ApplicationController
  def home
    @lives = Life.all
  end

  def about
  end
end
