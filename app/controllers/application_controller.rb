class ApplicationController < ActionController::Base
  # protect_from_forgery
  helper :all
  
  include LoadSpanishTalk

end
