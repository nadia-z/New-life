class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    if user_signed_in?
      @lives = Life.where.not(user_id: current_user.id)
    else
      @lives = Life.all
    end
  end

  def about
  end
end
