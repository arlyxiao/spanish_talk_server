module LoadSpanishTalk

  def is_from_android?
    return true if request.user_agent.include?("android")
    return false
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    if current_user.nil?
      return render :text => 'Access denied', :status => 401
    end
  end
  
end 