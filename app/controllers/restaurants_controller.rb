class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restuarant.select {|restaurant| restaurant.name == params[:search].downcase}
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine_id)
  end

end
