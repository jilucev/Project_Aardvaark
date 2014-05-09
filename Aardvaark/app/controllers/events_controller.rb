class EventsController < ApplicationController

  def index
    restrict_access
    # @events = Event.all
  end

  def new
    @organization = Organization.find(params[:id])
    @event = @organization.events.build
  end

  def show
    @event_users = EventUser.new

    @event = Event.find(params[:id])
    @organization = Organization.find(@event.organization_id)
    @user = User.find(params[:user_id])
    @users = User.belong_to_org?(@organization)

    @committed_users = User.committed?(@event)
    @available_users = User.available?(@event, @users)

    @upcoming_events = User.upcoming_events(@user)

    @mailing = AardvaarkMailer.event_details.deliver
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to organization_path(params[:organization_id])
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to organization_path(params[:organization_id])
    else
      render organization_path(params[:organization_id])
    end
  end

  protected

  def event_params
    params.require(:event).permit(
      :date, :description, :event_time, :location, :user_id, :organization_id, :type_of_event
      )
  end
end
