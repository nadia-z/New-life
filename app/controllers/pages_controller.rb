class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    query = params[:query]
    if user_signed_in? && query
      if query.match?(/([a-z] *|\d *)/) == true #prevents sql injection
        sub_query = "title ILIKE :query OR description_long ILIKE :query"
        @lives = Life.where(sub_query, query: "%#{query}%").where.not(user_id: current_user.id)
      else
        @warning = "only letters and numbers are accepted"
        @lives = Life.all
      end
    elsif query
      if query.match?(/([a-z] *|\d *)/) == true
        sub_query = "title ILIKE :query OR description_long ILIKE :query"
        @lives = Life.where(sub_query, query: "%#{query}%")
      else
        @warning = "only letters and numbers are accepted"
        @lives = Life.all
      end

    elsif user_signed_in?
      @lives = Life.where.not(user_id: current_user.id)
    else
      @lives = Life.all
    end
  end

  def about
  end

end
