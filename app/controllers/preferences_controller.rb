class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end
  end

  def new
    @cuisines = Cuisine.all
    @preference = Preference.new

  end

  def create
    @preference = Preference.new(preference_params)

    preference_params[:cuisine_ids].each do |cuid|
      CuisinesPreference.create(preference_id: @preference.id, cuisine_id: cuid.to_i)
    end

    @preference.save
    redirect_to preference_path(@preference)

  end

  private
  def preference_params
    params.require(:preference).permit(:user_id, cuisine_ids:[])
  end

end
