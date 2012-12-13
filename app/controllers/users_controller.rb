class UsersController < ApplicationController
  layout :false

  def create
    user = User.create(params[:user])

    p '-----------------'
    p params[:user]
    p '--------------'

    # User.create(
    #   :username => 'aaa',
    #   :email => 'bbb@gmail.com',
    #   :password => 'cccccc'
    # )

    return render :json => {:user_id => user.id, :username => user.username} if user.id
    return render :nothing => true, :status => 404
  end


  def do_login
    user = User.check_login(params[:email], params[:password])
  
    return render :json => {:user_id => user.id, :username => user.username} if user
    return render :nothing => true, :status => 404
   end
end
