module LoadSpanishTalk

  def is_from_android?
    return true if request.user_agent.include?("android")
    return false
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end 