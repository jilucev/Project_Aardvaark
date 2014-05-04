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

  def check_profile(current_user)
    if !user_message(current_user)
      puts "Welcome back, #{current_user.firstname}"
    else
      render :new, notice: "#{@message}"
    end
  end
    

  def user_message(current_user)
    add_to_message = ""
    @message = "We still need your #{add_to_message}. Please complete your profile."
    case current_user
      when !current_user.firstname
        add_to_message += 'first name' 
      when !current_user.lastname
        add_to_message += 'last name'
      when !current_user.email
        add_to_message += 'email'
      when !current_user.phone
        add_to_message += 'phone number'
      when !current_user.gender
        add_to_message += 'gender'
      when !current_user.skills
        add_to_message += 'skills'
      when !current_user.age
        add_to_message += 'age'
      when !current_user.vehicle
        add_to_message += 'vehicle'
      when !current_user.passenger_capacity
        add_to_message += 'passenger capacity'
      else
        @message = nil
      end
      @message
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
