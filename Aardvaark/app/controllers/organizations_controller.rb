class OrganizationsController < ApplicationController

  def index
    @organization = Organization.new
    @organizations = Organization.all
    @users = User.all
  end

   def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

      if @organization.save
        session[:organization_id] = @organization.id
        redirect_to organizations_path, notice: "Hello, #{@organization.name}!"
      else
        # render :root
        redirect_to root_path, notice: "Hello, #{@organization.name}!"
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
    params.require(:organization).permit(:email, :password, :name)
  end
end