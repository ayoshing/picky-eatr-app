class CuisinesPreferencesController < ApplicationController

  def create
    session[:selected_cuisine_id] = params[:cuisines_preference][:cuisine_id]

    session[:remove_cuisine] = session[:matches].select do |cuisine|
      cuisine["id"] != session[:selected_cuisine_id][0]["cuisine_id"]
    end

    session[:matchup_start] = true

    redirect_to preference_path(session[:preference_id])
  end

  def update

  end

end
