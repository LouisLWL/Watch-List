class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'New bookmark was created successfully!'
    else
      render :new
    end
  end

  def destroy

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
