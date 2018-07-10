class CuisinesController < ApplicationController
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


  private
  def preference_params
    params.require(:preference).permit(:name)
  end
end
