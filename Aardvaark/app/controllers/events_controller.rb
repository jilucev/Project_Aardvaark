class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
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
