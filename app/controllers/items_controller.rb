class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
    @item = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
