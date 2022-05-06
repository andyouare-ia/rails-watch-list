class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  # GET "lists/38"
  def show
    @list = List.find(params[:id])
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

end
