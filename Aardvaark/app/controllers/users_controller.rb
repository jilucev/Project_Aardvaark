class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.user.id
      redirect_to users_path, notice: "Hello, #{@user.firstname}!"
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
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password)
  end
end

