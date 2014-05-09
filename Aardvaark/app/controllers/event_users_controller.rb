require 'pry'
class EventUsersController < ApplicationController
  respond_to :json

  def new
    @event_users = EventUser.new
  end

# @pagetime = Pagetime.new(params[:pagetime])
# @pagetime.user = current_user

# respond_to do |format|
#   if @pagetime.save
#     format.html { redirect_to @pagetime, notice: 'Pagetime was successfully created.' }
#     format.json { render json: @pagetime, status: :created, location: @pagetime }
#   else
#     format.html { render action: "new" }
#     format.json { render json: @pagetime.errors, status: :unprocessable_entity }
#   end
# end

  # def create
  #   binding.pry
  #   @event_users = EventUser.new(value)
    
  #   respond_to do |format|
  #     if @event_users.save
  #       format.html { redirect_to :root, notice: "Success!" }
  #       format.js   {}
  #       format.json { render json: @event_users }
  #     else
  #       format.html {render action: "new"}
  #       format.json {render json: @event_users.errors, status: :unprocessable_entity}
  #   end
  # end

  def create
    @event_users = EventUser.new(event_user_params)

    if @event_users.save
      redirect_to user_event_path(current_user.id, @event_users.event_id)
    else
      render :new
    end
  end

  def edit
  end
  
  def destroy
    @event_user = EventUser.find(params[:id])
    @event = @event_user.event_id

    if @event_user.destroy
      redirect_to user_event_path(current_user, @event)
    else
      render user_event_path(current_user, @event)
    end
  end

  def update
  end

  protected

  def event_user_params
    params.require(:event_user).permit(:user_id, :event_id)
  end

end
