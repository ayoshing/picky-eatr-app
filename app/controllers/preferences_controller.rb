class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
    session[:preference_id] = params[:id]

    @cuisines_preference = CuisinesPreference.new

    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end

    if !session[:matchup_start]
      @match_cuisines = @cuisines_preferences.slice!(0..1).map do |match|
        match.cuisine
      end
      session[:matches] = @match_cuisines
    else
      @cuisines_preferences.delete_if {|cf| cf.cuisine_id == session[:matches][0]["id"] || cf.cuisine_id == session[:matches][1]["id"]}

      next_cuisine = @cuisines_preferences.map {|match| match.cuisine }.sample

      @match_cuisines = [Cuisine.find(session[:selected_cuisine_id]), next_cuisine]
      byebug
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

    session[:preference_id] = @preference.id

    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end

    session[:selected_cuisines] = @cuisines_preferences

    redirect_to preference_path(@preference)

  end

  def update

  end

  private
  def preference_params
    params.require(:preference).permit(:user_id, cuisine_ids:[])
  end

end
