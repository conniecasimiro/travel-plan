class RoutesController < ApplicationController
  def index
    @route = Route.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @route = Route.new
    @routes = @trip.routes
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @route = Route.new(route_params)
    @route.trip = @trip
    @routes = @trip.routes
    if @route.save
      @route = Route.new
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
end
