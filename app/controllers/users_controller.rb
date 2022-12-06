class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @trips = Trip.where(user: current_user)
    @bookmarks = @user.bookmarks
  end
end
