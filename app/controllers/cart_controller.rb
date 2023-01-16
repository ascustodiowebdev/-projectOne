class CartController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def new
    @user = current_user
    @item = Item.find(params[:item_id])
    @cart = Cart.new(user_id: @user.id, item_id: @item.id)
    @cart.price = 0
    @cart.quantity = 1
    if @cart.save!
      @cart.price += @item.price
      @cart.quantity += 1
      @cart.save!
      redirect_to cart_index_path
    end
  end

  def index
    @cart = Cart.find(current_user.id)
    @item = Item.find(@cart.item_id)
  end

  
  # private

  # def cart_params
  #   params.require(:cart).permit(:quantity, :price, :item_id)
  # end
end
