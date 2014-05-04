class UsersController < ApplicationController

  def index
    restrict_access
    @users = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

def check_profile(current_user)
    if !user_message(current_user)
      "Welcome back, #{current_user.firstname}"
    else
      "Hi #{current_user.firstname}. #{@message}"
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


  def show
    restrict_access
    @organizations = Organization.all
    @user = User.find_by(params[:id])
    @display_message = check_profile(current_user)
  end

  def edit
  end

  def update
  end

  def profile
    
  end

  def destroy
  end


protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :gender, :age, :vehicle, :passenger_capacity )
  end
end

