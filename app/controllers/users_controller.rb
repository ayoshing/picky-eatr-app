class UsersController < ApplicationController
skip_before_action :authorized?, only: %i[new create]

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
<<<<<<< HEAD

    # if @user.save
    #   redirect_to secrets_path, notice: "User was successfully created"
    # else
    #   render :new
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
=======
    if @user.save
      log_in_user(@user.id)
      session[:user_id] = @user.id
      redirect_to preferences_path, notice: 'User was successfully created.'
>>>>>>> final-countdown
    else
      render :new
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:name, :password, :address)
=======
    params.require(:user).permit(:username, :name, :password, :address)
>>>>>>> final-countdown
  end
end
