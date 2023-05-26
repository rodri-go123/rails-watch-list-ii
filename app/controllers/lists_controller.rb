class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new # Let's remove this later and see if it still works
  end

  def new
    @list = List.new
    # this list gets passed to create
    # it is kind of a temporary object which will only exist in params
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
      # navigates to list/id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
