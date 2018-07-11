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
    @preference = Preference.create(preference_params)
    preference_params[:cuisine_ids].shift
    @cuisinespreference = CuisinesPreference.new(preference_id: @preference.id, cuisine_id: preference_params[:cuisine_id])
    # preference_params[:cuisine_ids].each do |id|
    #   @preference.cuisines << Cuisine.find(id) if id != ""
    # end

    @preference.save

    redirect_to preferences_path

  end

  private
  def preference_params
    params.require(:preference).permit(:user_id, cuisine_ids:[])
  end

end
