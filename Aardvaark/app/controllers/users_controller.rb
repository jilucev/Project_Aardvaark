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


  def show
    restrict_access
    @organizations = Organization.all
    @event = Event.new
    
    @params = params[:id]
    @user = User.find(@params)

    @upcoming_events = User.upcoming_events(@user)
    @open_events = User.open_events(@user)
    @organizations_not_joined = User.organizations_not_joined(@user)
    @organization_volunteer_pending = User.organization_volunteer_pending(@user)
    @organizations_volunteering_at = User.organizations_volunteering_at(@user)
    @organizer = User.organizer?(@user)
  end

  def edit
  end

  def update
  end

  def profile
  end

  def destroy
  end

  def volunteer_request
    # @volunteer_request = (organization: params[:organization_id], user: params[:id], role_code: 0)

    # if @volunteer_request.save
    #   redirect_to root_path, notice: "Request sent to #{organization}! Super duper!"
    # end
  end

protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :gender, :age, :vehicle, :passenger_capacity )
  end
end

