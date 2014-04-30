class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])# && !user.organization
      session[:user_id] =  user.id
      redirect_to users_path, notice: "Welcome back, #{user.firstname}!"
    # elsif user && user.authenticate(params[:password])
    #   session[:user_id] =  user.id
    #   redirect_to organizations_path
    else
      flash.now[:alert] = "Log in failed..."
      # render :new
      redirect_to users_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "And don't let the door kick your ass on the way out."
  end
end
