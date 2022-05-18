class ReviewsController < ApplicationController
  before_action :set_restaurants, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurants
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
