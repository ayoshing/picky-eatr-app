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
    @preference = Preference.new(preference_params)

    # preference_params[:cuisine_ids].each do |id|
    #   @preference.cuisines << Cuisine.find(id) if id != ""
    # end
    byebug
    @preference.save
    redirect_to preferences_path

  end

  private
  def preference_params
    params.require(:preference).permit(:user_id)
  end

end
