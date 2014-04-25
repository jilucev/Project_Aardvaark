class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Hello, #{@user.firstname}!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end

