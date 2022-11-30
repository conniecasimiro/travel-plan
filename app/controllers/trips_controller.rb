class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to new_trip_route_path(@trip)
    else
      render :new, status: :unprocessable_entity
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
    @routes = @trip.routes
    @landmarks = @trip.landmarks
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
    params.require(:trip).permit(:title, :description, :location, :duration, :start_date, :photo)
  end
end
