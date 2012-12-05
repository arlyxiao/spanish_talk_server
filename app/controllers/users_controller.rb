class UsersController < ApplicationController
  before_filter :pre_load
  def pre_load
    render :layout => false
  end


  def create
    User.create(
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
  end
end
