class CartController < ApplicationController
  def new
    @user = current_user
    @item = Item.find(params[:item_id])
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @item = Item.find(params[item_id])
    @cart.user = current_user
    @cart.item = @item
    if @cart.save
      redirect_to cart_path(@item, @cart)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :price, :item_id)
  end
end
