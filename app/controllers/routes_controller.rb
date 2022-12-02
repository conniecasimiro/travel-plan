class RoutesController < ApplicationController
  def index
    @route = Route.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @route = Route.new
    @route.landmarks.build
    @routes = @trip.routes
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @route = Route.new(route_params)
    @route.method = "test" if route_params[:method].nil?
    @route.duration = 0 if route_params[:duration].nil?
    @route.trip = @trip
    if @route.save!
      @landmark = Landmark.create(landmark_params)
      @landmark.route = @route
      redirect_to new_trip_route_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @route = Route.find(params[:id])
    @route.update
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
  end

  private

  def route_params
    params.require(:route).permit(:destination, :method, :duration, :travel_date)
  end

  def landmark_params
    params.require(:route).permit(landmark_attributes: %i[id title location photo])
  end
end
