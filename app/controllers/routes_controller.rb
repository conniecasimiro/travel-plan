class RoutesController < ApplicationController
  def index
    @route = Route.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @route = Route.new
    @route.landmarks.build
    @routes = @trip.routes
    @route_icons = {
      plane: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108118/plane-solid_xmddzb.svg",
      train: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108196/train-subway-solid_vdic1m.svg",
      ferry: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/ferry-solid_dhpijy.svg",
      yacht: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108358/sailboat-solid_xm2vkv.svg",
      car: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107399/car-solid_rqbpth.svg",
      bus: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/bus-solid_r60kus.svg",
      motorcycle: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108470/motorcycle-solid_sm5irb.svg",
      first_location: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/location-dot-solid_zgly27.svg"
    }
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @route = Route.new(route_params)
    @route.method = "first_location" if route_params[:method].nil?
    @route.duration = 0 if route_params[:duration].nil?
    @route.trip = @trip
    if @route.save!
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
