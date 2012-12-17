class UsersController < ApplicationController

  def create
    user = User.create(params[:user])
    session[:user_id] = user.id if user
    p '-----------------'
    p params[:user]
    p '--------------'


    return render :json => {:user_id => user.id, :username => user.username} if user
    return render :nothing => true, :status => 404
  end


  def new
  end


  def do_login
    session[:user_id] = 0
    user = User.check_login(params[:user])
    session[:user_id] = user.id if user


    if is_from_android?
      return render :json => {:user_id => user.id, :username => user.username} if user
      return render :nothing => true, :status => 404
    else
      return render :text => session[:user_id]
    end

  end


  def show
    render :text => current_user.id
  end


  def destroy
    session[:user_id] = nil
    return render :nothing => true, :status => 404 
  end

end
