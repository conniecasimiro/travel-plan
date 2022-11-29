class RoutesController < ApplicationController
  def index
    @route = Routes.all
  end

  def new
    @route = Routes.new
  end

  def create
    @route = Routes.new(route_params)
    @route.user = current_user
    if @route.save
      redirect_to trip_routes_path(@route)
    end
  end

  def update
    @route = Routes.find(params[:id])
    @route.update
  end

  def destroy
    @route = Routes.find(params[:id])
    @route.destroy
  end

  private

  def landmark_params
    params.require(:landmark).permit(:start_point, :end_point, :method, :duration)
  end
end
