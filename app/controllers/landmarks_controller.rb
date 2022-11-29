class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @landmark = Landmark.new(landmark_params)
    @landmark.trip = @trip
    if @landmark.save
      redirect_to trip_path(@trip)
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
    params.require(:landmark).permit(:title, :location, :description)
  end
end
