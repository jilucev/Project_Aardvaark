class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.new
    @users = User.all
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

  def update
  end

  def destroy
  end
  
  protected

  def organization_params
    params.require(:organization).permit(:name, :email, :representative_name, :password)
  end
end
