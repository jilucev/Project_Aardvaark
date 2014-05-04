class SessionsController < ApplicationController

  def new
  end

  def create
    # if User.find_by(email: params[:email])
    #   user_assign
    # elsif Organization.find_by(email: params[:email])
    #   organization_assign
    # else
    #   render :root
    # end
  end

  def user_assign
    user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        @current_user = user
        redirect_to users_profile_path(user.id)
        check_profile(current_user)
      else
        render :file => 'public/index.html.haml'
      end
      
      # if user && user.authenticate(params[:password]) && !user.organization
      #   session[:user_id] = user.id
      #   redirect_to users_path
      # elsif user && user.authenticate(params[:password])
      #   session[:user_id] = user.id
      #   redirect_to user_path(user.id)
      # else
      #   render :file => 'public/index.html.haml'
      # end
  end

  def organization_assign
    organization = Organization.find_by(email: params[:email])
      
      if organization && organization.authenticate(params[:password]) 
        session[:organization_id] = organization.id
        redirect_to organization_path(organization.id)
      else
        render :file => 'public/index.html.haml'
      end
  end

  def destroy
    session[:user_id] = nil || session[:organization_id] = nil
    redirect_to root_path, notice: "Peace!"
  end

end
