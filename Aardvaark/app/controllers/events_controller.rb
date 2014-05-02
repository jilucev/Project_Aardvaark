class EventsController < ApplicationController

  def index
    restrict_access
    # @events = Event.all
  end

  def new
    @organization = Organization.find(params[:id])
    @event = @organization.events.build
  end

  # def show
  #   # @event = Event.new
  #   @event = @organization.events.build
  # end

  def create
    @organization = Organization.find(params[:organization_id])
    @event = @organization.events.build(event_params)
    @event.organization_id = current_user.id

    if @event.save
      redirect_to organizations_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end

  protected

  def event_params
    params.require(:event).permit(
      :date, :description, :event_time, :location
      )
  end
end
