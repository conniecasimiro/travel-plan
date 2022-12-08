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
    distinct_landmarks = Landmark.distinct(:route).distinct(:trip)
    distinct_landmarks_route_ids = distinct_landmarks.pluck(:route_id)
    routes = Route.where(id: distinct_landmarks_route_ids)
    trip_ids = routes.pluck(:trip_id)
    @featured = Trip.where(id: trip_ids).sample(4)
  end
end
