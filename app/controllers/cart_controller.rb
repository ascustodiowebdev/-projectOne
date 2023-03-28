class CartController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  # def new
  #   @user = current_user
  #   @cart = Cart.new(user_id: @user.id)
  #   if @cart.save!
  #     redirect_to cart_index_path
  #   else
  #     p "failed to create cart"
  #   end
  # end

  # def create
  #   @user = current_user
  #   @item = Item.find(params[:item_id])
  #   @cart.item_id << @item.id
  #   @cart.save!
  #   redirect_to cart_index_path
  # end

  # def index
  #   @cart = Cart.find_by(user_id: current_user.id)
  #   if @cart.present? && @cart.item_id.present? && !@cart.item_id.empty?
  #     # do something with the cart
  #   else
  #     flash.now[:notice] = "Your cart is empty, please add an item to cart"
  #   end
  # end

  def index
    @cart = Cart.find_by(user_id: current_user.id)
    if @cart.blank? || @cart.item_id.blank?
      p "Your cart is empty, please add an item to cart"
    else
      @items = Item.where(id: @cart.item_id)
    end
  end

  def show
  end

  def new
    @user = current_user
    @cart = Cart.new(user_id: @user.id)
    if @cart.save
      session[:cart_id] = @cart.id  # add this line
      redirect_to cart_index_path
    else
      p "Failed to create cart"
    end
  end

  def create
    @user = current_user
    @item = Item.find(params[:item_id])
    @cart = Cart.find_or_create_by(user_id: @user.id)
    @cart.item_ids << @item.id
    if @cart.save
      redirect_to cart_index_path
    else
      p "Failed to add item to cart"
    end
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    if @cart.destroy!
      @cart.save!
      redirect_to items_path
    end
  end
  # private

  # def cart_params
  #   params.require(:cart).permit(:quantity, :price, :item_id)
  # end
end
