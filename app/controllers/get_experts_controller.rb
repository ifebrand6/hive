class GetExpertsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]


  def index
    if ((current_user.customer_role || current_user.guest) === (true))
      @request = Request.new(user_id: current_user.id)
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
