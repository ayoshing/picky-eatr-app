class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @preference = Preference.find(params[:id])
    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end
    @cuisine_1 = Match.get_random(@cuisines_preferences)
    @cuisine_2 = Match.get_random(@cuisines_preferences)
    @match = Match.create(cuisine_id: @cuisine_1.cuisine_id, challenger_id: @cuisine_2.cuisine_id )
    byebug
    redirect_to preference_match_path(@preference, @match)
  end

  def show
    @match = Match.find(params[:id])
  end

  private

  def match_params
    params.require(:match).permit(:cuisine_id, :challenger_id)
  end
end
