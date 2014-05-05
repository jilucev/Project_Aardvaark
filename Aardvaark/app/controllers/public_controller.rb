class PublicController < ApplicationController

  def index
    @user = User.new
    @organization = Organization.new
  end

end
