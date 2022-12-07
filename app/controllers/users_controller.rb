class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @trips = Trip.where(user: current_user)
    @bookmarks = @user.bookmarks
  end

    private

  def trip_params
    params.require(:trip).permit(:title, :description, :location, :duration, :start_date, :likes, tag_ids: [])
  end
end
