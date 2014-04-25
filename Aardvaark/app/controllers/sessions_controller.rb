class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password]) && user.volunteer
      session[:user_id] =  user.id
      redirect_to users_path
      console.log("A mutherfrakkin' VO-LUN-TEER!")
    elsif user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      redirect_to organizations_path
      console.log("A mutherfrakkin' OR-GA-NY-ZAY-HAY-HAY-HAAAAAY-SHUN!")
    else
      render :new
    end
    
  end
end
