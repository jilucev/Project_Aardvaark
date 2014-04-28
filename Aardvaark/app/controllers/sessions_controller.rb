class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password]) && !user.organization
      session[:user_id] =  user.id
      redirect_to users_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      redirect_to organizations_path
    else
      #Fix this
      render :new
    end
    
  end
end
