class AndroidController < ApplicationController
  before_filter :login_required
  
  def index
    render :nothing => true, :status_code => 200
  end
end