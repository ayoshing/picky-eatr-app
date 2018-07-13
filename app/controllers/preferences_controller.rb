class PreferencesController < ApplicationController
  before_action :cuisine_preference, only: [:show]
  before_action :set_authors, only: %i[new create edit update]
  def index
    @preferences = @logged_in_user.preferences
  end

  def show

    if !session[:matchup_start]
      @match_cuisines = @cuisines_preferences.slice(0..1).map do |match|
        match.cuisine
      end

      session[:delete_tracker] = []

      @match_cuisines.each do |cuisine|
        session[:delete_tracker] << cuisine.id
      end

      session[:matches] = @match_cuisines

    else
      session[:delete_tracker].each do |cuisine_id|
        @cuisines_preferences.delete_if{|instance| instance.cuisine_id == cuisine_id}
      end

      # @cuisines_preferences.delete_if do |cp|
      #   session[:delete_tracker].each do |cuisine_id|
      #     cp.cuisine_id == cuisine_id
      #   end
        next_cuisine = @cuisines_preferences.map {|match| match.cuisine }.sample
        if next_cuisine == Cuisine.find(session[:selected_cuisine_id])
          session[:delete_tracker] << next_cuisine.id
          session[:delete_tracker].each do |cuisine_id|
            @cuisines_preferences.delete_if{|instance| instance.cuisine_id == cuisine_id}
          end
          next_cuisine = @cuisines_preferences.map {|match| match.cuisine }.sample
        end
        @match_cuisines = [Cuisine.find(session[:selected_cuisine_id]), next_cuisine]
        session[:matches] = @match_cuisines

        if @cuisines_preferences.length == 0
          @results = Yelp.search_yelp(Cuisine.find(session[:selected_cuisine_id].to_i).name, User.find(session[:user_id]).address)["businesses"]
        end
      end
  end

  def new
    @cuisines = Cuisine.all
    @preference = Preference.new
    session[:delete_tracker] = []
  end

  def create
    @preference = Preference.new(preference_params)
    @preference.user = @logged_in_user
    preference_params[:cuisine_ids].each do |cuid|
      CuisinesPreference.create(preference_id: @preference.id, cuisine_id: cuid.to_i)
    end
    @preference.save


    session[:preference_id] = @preference.id

    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end
    
    if @preference.valid?
      redirect_to preference_path(@preference), notice: "Preference successfully created."
    else
      render :new
    end
  end


  def update
    if @preference.author == @logged_in_user && @preference.update(preference_params)
      redirect_to @preference, notice: 'Secret was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /secrets/1
  def destroy
    @preference.destroy if @preference.author == @logged_in_user
    redirect_to preferences_url, notice: 'Secret was successfully destroyed.'
  end


  private
  def preference_params
    params.require(:preference).permit(@logged_in_user.id, cuisine_ids:[])
  end

  def cuisine_preference
    @preference = Preference.find(params[:id])
    session[:preference_id] = params[:id]
    @cuisines_preference = CuisinesPreference.new
    @cuisines_preferences = CuisinesPreference.all.select do |cuisine_pref|
      cuisine_pref.preference_id == @preference.id
    end
    session[:cuisines_preferences] = @cuisines_preferences
  end

  def set_authors
    @authors = User.all
  end
end
