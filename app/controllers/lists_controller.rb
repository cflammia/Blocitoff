class ListsController < ApplicationController
  before_action :authenticate_user! #users must be signed in before any lists_controller method

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @title = @list.title
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
  end

  def update
  end

  def destroy
  end

  def list_params
  end
end
