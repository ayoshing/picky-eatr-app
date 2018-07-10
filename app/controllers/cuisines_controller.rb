class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all
    if params[:search]
      @cuisines = Cuisine.select {|cuisine| cuisine.name == params[:search].downcase}
    else
      @cuisines = Cuisine.all
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end


  private
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
