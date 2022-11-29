class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    # @trip.user = current_user
    if @trip.save
      redirect_to trips_path(@trip)
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trips_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
    @landmarks = Landmark.where(trip_id: @trip.id)
    @comments = Comment.where(trip_id: @trip.id)
  end

  def index
    @trips = Trip.all
  end

  # def likes
  # end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :location, :duration)
  end
end
