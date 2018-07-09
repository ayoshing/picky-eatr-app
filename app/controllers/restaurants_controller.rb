class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restuarant.select {|restaurant| restaurant.name == params[:search].downcase}
    else
      @restaurants = Restaurant.all
    end
  end

  def new
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
