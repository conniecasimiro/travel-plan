class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new
    @route = Route.find(params[:route_id])
    @route_icons = {
      plane: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108118/plane-solid_xmddzb.svg",
      train: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108196/train-subway-solid_vdic1m.svg",
      ferry: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/ferry-solid_dhpijy.svg",
      yacht: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108358/sailboat-solid_xm2vkv.svg",
      car: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107399/car-solid_rqbpth.svg",
      bus: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/bus-solid_r60kus.svg",
      motorbike: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670108470/motorcycle-solid_sm5irb.svg",
      first_location: "https://res.cloudinary.com/dblvfwtds/image/upload/v1670107398/location-dot-solid_zgly27.svg"
    }
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new(landmark_params)
    @route = Route.find(params[:route_id])
    @landmark.route = @route
    if @landmark.save!
      redirect_to new_trip_route_landmark_path(@trip, @route)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @landmark = Landmark.find(params[:id])
    @landmark.update
    redirect_to trip_landmarks_path(@landmark)
  end

  def show
    @landmark = Landmark.find(params[:id])
  end

  def destroy
    @landmark = Landmark.find(params[:id])
    @landmark.destroy
  end

  private

  def landmark_params
    params.require(:landmark).permit(:title, :location, :description, :photo)
  end
end
