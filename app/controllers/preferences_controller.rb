class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
    if params[:search]
      @preferences = Preference.select {|preference| preference.name == params[:search].downcase}
    else
      @preferences = Preference.all
    end
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
    byebug
      @preference.save

      redirect_to preferences_path

  end

  private
  def preference_params
    params.require(:preference).permit(:name, :user_id)
  end

end
