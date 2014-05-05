class RelationshipJunctionsController < ApplicationController

  def new
    @invite = RelationshipJunction.new
  end

  def create
    @invite = RelationshipJunction.new(invite_params)

    if @invite.save
      #YES
    else
      #render :new
    end
  end

  def update
  end

  def destroy
    @invite = RelationshipJunction.find(params[:id])

    if @invite.destroy
      redirect_to organization_path(current_user)
    else
      render organization_path(current_user)
    end
  end
  
end
