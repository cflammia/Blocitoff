class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to @list, notice: 'Your new To-Do Item was saved!'
    else
      redirect_to @list, notice: 'You forgot to enter a To-Do item. Please try again.'
    end
  end

  def destroy
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    title = @item.title

    if @item.destroy
      flash[:notice] = "\"#{item}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the list."
    end

    respond_with(@item) do |format|
      format.html {redirect_to list_items_path}
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
