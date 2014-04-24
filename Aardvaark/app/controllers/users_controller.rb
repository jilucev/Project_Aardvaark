class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.user_id
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
end


