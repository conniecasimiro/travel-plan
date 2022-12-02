class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.likes = 0
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
    respond_to do |format|
      format.html { redirect_to trip_path }
      format.json { render json: @trip.to_json }
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @routes = @trip.routes
    @landmarks = @trip.landmarks
    @comments = Comment.where(trip_id: @trip.id)

    # The `geocoded` scope filters only flats with coordinates
    @lmarkers = @landmarks.geocoded.map do |landmark|
      {
        lat: landmark.latitude,
        lng: landmark.longitude,
        id: landmark.id
      }
    end

    @rmarkers = @routes.geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end

    @rmarkersplane = @routes.where(method: "Plane").geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end


    @rmarkersbike = @routes.where(method: "Motorcycle").geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end

    @rmarkersboat = @routes.where(method: "Boat").geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end

    @rmarkersbus = @routes.where(method: "Bus").geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end

    @rmarkerscar = @routes.where(method: "Car").geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude
      }
    end


    @arr = []
    @routes.each do |route|
      @arr << [route.longitude, route.latitude]
    end
  end

  def index
    @landmark = Landmark.all

    if params[:query].present?
      sql_query = <<~SQL
        trips.location ILIKE :query
        OR trips.description ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @trips = Trip.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.all
    end
    # @trips = Trip.all
  end

  def carousel
    @landmark = Landmark.all

    if params[:query].present?
      sql_query = <<~SQL
        trips.location ILIKE :query
        OR trips.description ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @trips = Trip.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.all
    end
    # @trips = Trip.all
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :location, :duration, :start_date, :likes)
  end
end
