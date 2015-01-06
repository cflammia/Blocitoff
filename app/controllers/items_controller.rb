class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to lists_path(id:@item.list_id), notice: 'Your new To-Do Item was saved!'
    else
      flash[:notice] = 'You forgot to enter a To-Do item. Please try again.'
      redirect_to :back
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
