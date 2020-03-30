class GetExpertsController < ApplicationController
  before_action :current_or_guest_user
  skip_before_action :authenticate_user!, :only => [:index]


  def index
    if (current_or_guest_user)
      @request = Request.new(user_id: current_or_guest_user.id)
      @request.save! 
    else
      redirect_to root_path 
    end
  end

  private
    def request_params
      params.require(:request).permit(:user_id)
    end
    
end
