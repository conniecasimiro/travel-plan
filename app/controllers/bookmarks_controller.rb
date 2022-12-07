class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.trip = @trip
    respond_to do |format|

      if @bookmark.save
        format.html {redirect_to trip_path(@trip)}
        format.json
      end
    end
  end

  def index
    @bookmark = Bookmark.all
  end

  def show
    @user = User.find(params[:user_id])
    @bookmarks = Bookmark.where(user: current_user)
    @trip = Trip.find(params[:trip_id])
    @bookmark.trip = @trip
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @trip = @bookmark.trip
    @bookmark.destroy
    respond_to do |format|
      format.json
      format.html {redirect_to request.referer, status: :see_other}
    end
  end
end
