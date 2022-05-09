class ListsController < ApplicationController
  def index
    @lists = List.all.sort { |a, b| a.name <=> b.name }
  end

  # GET "lists/38"
  def show
    @list = List.find(params[:id])
    @movies = sort_movies(@list)
  end

  # GET "list/new"
  def new
    @list = List.new
  end

  # POST "lists"
  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  # method to order movies by title and rating
  def sort_movies(list)
    list.movies.sort do |a, b|
      comp = b.rating <=> a.rating
      if comp.zero?
        comp = a.title <=> b.title
      end
      comp
    end
  end

end
