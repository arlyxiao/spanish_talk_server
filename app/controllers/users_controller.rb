class UsersController < ApplicationController

  def create
    @user = User.create(params[:user])
    session[:user_id] = @user.id if !@user.id.nil?
    
    p '-----------------'
    p params[:user]
    p '--------------'


    p @user

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      format.json {render :json => @user} if !@user.id.nil?
      format.json {render :nothing => true, :status => 404} if @user.id.nil?
     end
  end


  def new
  end


  def do_login
    session[:user_id] = 0
    @user = User.check_login(params[:user])
    session[:user_id] = @user.id if @user

    p @user

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      format.json {render :json => @user} if @user
      format.json {render :nothing => true, :status => 404} if !@user
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
