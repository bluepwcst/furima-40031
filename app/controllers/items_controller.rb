class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end
  
  def edit
    if @item.sold_out? || current_user.id != @item.user_id
      redirect_to root_path, alert: 'This item is not available for editing.'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
    redirect_to root_path, alert: 'Item not found.' if @item.nil?
  end
  
  def check_user
    unless current_user.id == @item.user_id
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :region_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
