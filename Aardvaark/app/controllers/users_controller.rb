class UsersController < ApplicationController

  def index
    restrict_access
    @users = User.new
    @display_message = "hgjhg"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end


  def show
    restrict_access
    @organizations = Organization.all
    @user = User.find_by(params[:id])
  end

  def edit
  end

  def update
  end

  def profile
    
  end

  def destroy
  end


protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :gender, :age, :vehicle, :passenger_capacity )
  end
end

