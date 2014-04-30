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
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Hello, #{@user.firstname}!"
    else
      # render :root
      redirect_to root_path, notice: "Hello, #{@user.firstname}!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to session_path, :method => :delete
  end

protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :phone)
  end
end

