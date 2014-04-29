class PublicController < ApplicationController

  def index
    @users = User.new
    @organizations = Organization.new
  end

end
