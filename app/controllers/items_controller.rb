class ItemsController < ApplicationController
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

  def item_params
    params.require(:item).permit(:name)
  end
end
