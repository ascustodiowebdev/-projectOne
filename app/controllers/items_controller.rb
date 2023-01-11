class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item was successfully created."
      redirect_to items_path
    else
      flash[:alert] = "Item could not be created. Please try again."
      render :new
    end
  end

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
