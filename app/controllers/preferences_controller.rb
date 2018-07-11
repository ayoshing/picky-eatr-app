class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @cuisines = Cuisine.all
    @preference = Preference.new
  end

  def create
    cuisine_arr = []
    preference_params[:cuisine_ids].each do |id|
      cuisine_arr << id
    end

    @preference = Preference.new(preference_params)
    @preference.save
    redirect_to preferences_path
    byebug
  end

  private
  def preference_params
    params.require(:preference).permit(:user_id, cuisine_ids: [])
  end

end
