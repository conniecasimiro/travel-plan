class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
  end

  def create
    @user = User.find(params[:user_id])
    @trip = Trip.find(params[:trip_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.trip = @trip
    @bookmark.save!
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    end
  end

  def index
    @bookmark.all
  end

  def show
    @user = User.find(params[:user_id])
    @bookmarks = Bookmark.where(user: current_user)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :trip_id)
  end

end
