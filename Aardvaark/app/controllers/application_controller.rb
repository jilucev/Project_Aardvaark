class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to root_path
    elsif current_user.id != params[:id].to_i #&& !current_user.admin
      flash[:alert] = "You don't have rights to access this area."
      redirect_to root_path
    end


  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    elsif session[:organization_id]
      @current_user = Organization.find(session[:organization_id])
    end
  end

  helper_method :current_user

end



