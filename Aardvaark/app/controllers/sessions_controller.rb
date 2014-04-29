
class SessionsController < ApplicationController
  def new
  end

  def create
    if User.find_by(email: params[:email])
      user_assign
    elsif Organization.find_by(email: params[:email])
      organization_assign
    end
  end

  def user_assign
    user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && !user.organization
      session[:user_id] =  user.id
      redirect_to users_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      redirect_to users_path
    else
      #Fix this
      render :new
    end
  end

  def organization_assign
    organization = Organization.find_by(email: params[:email])
    if organization && organization.authenticate(params[:password]) 
      session[:organization_id] =  organization.id
      redirect_to organizations_path
    else
      #Fix this
      render :new
    end
  end


  def destroy
    if @current_user 
      session[:id] = nil
    else
      puts "You're already logged out, sis!"

      
      # session[:user_id] = nil || session[:organization_id] = nil
    redirect_to root_path, notice: "Peace!"
  end
  end
end
