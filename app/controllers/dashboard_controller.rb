class DashboardController < ApplicationController
  #skip_before_action :authenticate_user!, :except => []

  def index
  end

  def application
    @expert_application_list = ExpertApplication.all.pending_application
  end

  def talents
    @expert_application_list = ExpertApplication.all.onboard_expert
  end
  def customers_requests
    @customers = User.all.where(customer_role: true)
  end
  def customer_requests
    @user = User.find(params[:id])
    @requests = @user.requests
  end
  def customer_talent_requests
    @request = Request.find(params[:id])
    @talent_requests =  @request.talent_requests
  end
  

  
  private
     def talent_types
      @talent_types = TalentType.all.find
     end
end


