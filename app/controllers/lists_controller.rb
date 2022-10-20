class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @movies_list
    @list = List.new
  end

  def create
    @list = List.new(set_list_params)
    if @list.save
      retirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def set_list_params
    params.require(:list).permit(:name)
  end

end
