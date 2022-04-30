class BookmarksController < ApplicationController

  # GET "lists/42/bookmarks/new"
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST "lists/42/bookmarks"
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  # DELETE "bookmarks/25"
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
