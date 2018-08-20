class CuisinesPreferencesController < ApplicationController

  def create
    session[:selected_cuisine_id] = params[:cuisines_preference][:cuisine_id]

    session[:remove_cuisine] = session[:matches].select do |cuisine|
      cuisine["id"] != session[:selected_cuisine_id].to_i
    end


    if session[:remove_cuisine].length == 0
      session[:matchup_start] = true
      redirect_to preference_path(session[:preference_id])
    else
      session[:delete_tracker] << session[:remove_cuisine][0]["id"]
      session[:delete_tracker].uniq!
      session[:matchup_start] = true

      redirect_to preference_path(session[:preference_id])
    end
  end

  def update

  end

end
