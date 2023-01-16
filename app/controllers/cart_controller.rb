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

  # def create
  #   p params
  #   @cart = Cart.new(cart_params)
  #   @cart.save
  #   if @cart.save
  #     redirect_to items_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
  def index
    @cart = Cart.last
  end
  # private

  # def cart_params
  #   params.require(:cart).permit(:quantity, :price, :item_id)
  # end
end
