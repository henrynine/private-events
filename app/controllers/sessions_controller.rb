class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    # no authentication for this project
    log_in @user
    redirect_to root_url
  end

  def destroy
    log_out
    redirect_to root_url
  end


end
