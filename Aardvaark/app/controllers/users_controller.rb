class UsersController < ApplicationController

#   before_validation(on: :create) do
#     self.phone = phone.gsub(/[^0-9]/, "") if attribute_present?("number")
#   end
# end
  
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create
    @users = User.all
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Hello, #{@user.firstname}!"
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to :root
  end

protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :phone)
  end
end

