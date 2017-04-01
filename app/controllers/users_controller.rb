class UsersController < ApplicationController
  def index
  	before_action :authenticate_user!
  end

  def show
  end
end
