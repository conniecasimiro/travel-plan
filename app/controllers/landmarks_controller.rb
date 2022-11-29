class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all
  end

  def new
    @landmark = Landmark.new
  end

  def create
    @landmark = Landmark.new(landmark_params)
    @landmark.user = current_user
    if @landmark.save
      redirect_to trip_landmarks_path(@landmark)
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
