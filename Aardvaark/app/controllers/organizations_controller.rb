class OrganizationsController < ApplicationController

  def index
    restrict_access
    @organizations = Organization.all
    @organization = Organization.new
    @users = User.all
    @events = Event.all
    @event = Event.new

    # if params[:age]
    #   query_params = params[:age].split("-")
    #   min = query_params[0].strip.to_i
    #   max = query_params[1].strip.to_i
    #   @users = @users.search_by_age(min, max)
    # end
  end

  def show
    restrict_access
    @event = Event.new
    @organization = Organization.find(params[:id]) 
    @invites = Organization.find_requests(@organization)
    @volunteers = Organization.find_volunteers(@organization)
    @volunteer_supers = Organization.find_volunteer_supers(@organization)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

      if @organization.save
        session[:organization_id] = @organization.id
        redirect_to root_path, notice: "Hello, #{@organization.name}!"
      else
        render :new
      end
  end


  def edit
  end

  def search
    # @users = Organization.users.all
    # @users = @users.with_vehicle(params[:vehicle]) if params[:vehicle].present?
    # @users = @users.are_female(params[:gender]) if params[:gender].present?
    # @users = @users.are_male(params[:gender]) if params[:gender].present?
  end

  def update
  end

  def destroy
  end
  
  protected

  def organization_params
    params.require(:organization).permit(:name, :email, :representative_name, :password)
  end
end
