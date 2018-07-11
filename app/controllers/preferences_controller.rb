class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    # if params[:id]
    #   @heroines = Heroine.select {|heroine| heroine.power.name == params[:search].downcase}
    # else
      @preference = Preference.find(params[:id])
      @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
        cuisine_pref.preference_id == @preference.id
      end
      @my_cuisines = @cuisines_preferences.map do |instance|
        Cuisine.find(instance.cuisine_id)
      end
      @matches = []
      rand_two = @my_cuisines.sample(2)
      rand_two.each do |num|
        @my_cuisines.delete(num)
      end
      @matches << rand_two

    end
    # end
    # def match(array)
    #   matches = []
    #   pick = ""
    #
    #   rand_two = array.sample(2)
    #   rand_two.each do |num|
    #     array.delete(num)
    #   end
    #   matches = rand_two
    #   until array.length == 0 do
    #     puts "Pick selection: #{matches[0]} or #{matches[1]}"
    #     pick = gets.chomp
    #     matches = [pick]
    #     rand_one = array.sample
    #     array.delete(rand_one)
    #     matches << rand_one
  #   #   end
  # end

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
    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end
    @cuisine_1 = Match.get_random(@cuisines_preferences)
    @cuisine_2 = Match.get_random(@cuisines_preferences)
    @match = Match.create(cuisine_id: @cuisine_1.cuisine_id, challenger_id: @cuisine_2.cuisine_id )

    byebug
    redirect_to new_preference_match_path(@preference)
  end

  private
  def preference_params
    params.require(:preference).permit(:user_id, cuisine_ids:[])
  end
end
