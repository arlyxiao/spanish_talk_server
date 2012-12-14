class UsersController < ApplicationController

  def create
    user = User.create(params[:user])

    p '-----------------'
    p params[:user]
    p '--------------'


    return render :json => {:user_id => user.id, :username => user.username} if user.id
    return render :nothing => true, :status => 404
  end


  def new
  end


  def do_login
    user = User.check_login(params[:user])
    session[:user_id] = user.id if user


    if is_from_android?
      return render :json => {:user_id => user.id, :username => user.username} if user
      return render :nothing => true, :status => 404
    else
      return render :text => 'eeee'
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
