class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path(@trip)
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update
  end

  def show
    @trip = Trip.find(params[:id])
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
    params.require(:trip).permit(:title, :description)
  end
end
