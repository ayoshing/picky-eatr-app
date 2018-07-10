class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    if params[:search]
      @favorites = Favorite.select {|favorite| favorite.name == params[:search].downcase}
    else
      @favorites = Favorite.all
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end



  def new
    @favorite = favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.valid?
      @favorite.save
      redirect_to favorite_path(@favorite)
    else
      flash[:error] = @favorite.errors.full_messages
      redirect_to new_favorite_path
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :restaurant_id)
  end
end
