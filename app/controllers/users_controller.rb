class UsersController < ApplicationController
  def index
    @users = User.all
    if params[:search]
      @users = User.select {|user| user.name == params[:search].downcase}
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = user.new
  end

  def create
    @user = User.new(user_params)

    # if @user.save
    #   redirect_to secrets_path, notice: "User was successfully created"
    # else
    #   render :new
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :address)
  end
end
