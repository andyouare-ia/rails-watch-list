class MoviesController < ApplicationController
  def index
    @movies = List.all
  end

  # GET "lists/38"
  def show
    @movie = Movie.find(params[:id])
  end
end
