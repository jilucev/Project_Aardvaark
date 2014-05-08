class EventUsersController < ApplicationController

  def new
    @event_users = EventUser.new
  end

  def create
    @event_users = EventUser.new(event_user_params)

    if @event_users.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  protected

  def event_user_params
    params.require(:event_users).permit(:user_id, :event_id)
  end

end
