class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new
    @route = Route.find(params[:route_id])


    # if params[:next]
    # @route = @trip.routes.first
    # end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new(landmark_params)
    @route = Route.find(params[:route_id])
    @landmark.route = @route
    if @landmark.save
      @landmark = Landmark.new
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
