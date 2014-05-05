class RelationshipJunctionsController < ApplicationController

  def new
    @invite = RelationshipJunction.new
  end

  def create
    @invite = RelationshipJunction.new(invite_params)

    # user.relationship_junctions.create(:organization => org, role_code: 0)

    if @invite.save
      #YES
    else
      #render :new
    end
  end

  def edit
    @volunteer = RelationshipJunction.find(params[:id])
  end

  def update
    @volunteer = RelationshipJunction.find(params[:id])
    @volunteer.role_code = 1

      if @volunteer.save
        redirect_to organization_path(current_user)
      else
        render organization_path(current_user)
      end
  end

  def destroy
    @invite = RelationshipJunction.find(params[:id])

    if @invite.destroy
      redirect_to organization_path(current_user)
    else
      render organization_path(current_user)
    end
  end

  protected

  def invite_params
    params.require(:user).permit(:organization_id, :role_code)
  end
end
