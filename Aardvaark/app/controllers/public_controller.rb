class PublicController < ApplicationController

  def index
    @users = User.new
  end

end
