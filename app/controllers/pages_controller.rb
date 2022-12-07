class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      sql_query = <<~SQL
        trips.location ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @trips = Trip.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.all
    end
    @featured = Trip.all.sample(4)
  end
end
