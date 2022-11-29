class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_paramss)
  end

  def index
    @bookmark.all
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :trip_id)
  end

end
