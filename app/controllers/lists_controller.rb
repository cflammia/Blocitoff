class ListsController < ApplicationController
  before_action :authenticate_user! #users must be signed in before any lists_controller method

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @title = @list.title
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.valid?
      @list.save
        redirect_to lists_path, notice: 'Your new list was saved.'
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to lists_path, notice: 'Your list was updated.'
    else
      flash[:error] = "There was an error updating the list. Please try again."
      render :edit
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    title = @list.title

    if @list.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list."
      render :show
    end
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
