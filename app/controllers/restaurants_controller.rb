class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [:show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
