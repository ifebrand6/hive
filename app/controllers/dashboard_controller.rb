class DashboardController < ApplicationController
  #skip_before_action :authenticate_user!, :except => []

  def index
  end

  def application
    @expert_list = ExpertApplication.all.pending_application
  end

  def talents
    @expert_list = ExpertApplication.all.onboard_expert
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
  def talent_assignment
    @talent_request = TalentRequest.find(params[:id])
    @talents = ExpertApplication.all.where(talent_type: @talent_request.talent_type_id)
    @finalized_request = FinalizedRequest.new
    @finalized_request.talent_assignments.build
  end
  def finalize_user_request
      @finalized_request = FinalizedRequest.new(final_params)
      if @finalized_request.save
        SendFinalRequestMailJob.perform_later(@finalized_request.id)
      flash[:notice] = "Talent Assign successfully"
      redirect_to root_path
    else
      render :talent_assignment
    end
  end
  
  private
     
     def final_params
      params.require(:finalized_request).permit(:user_id, :request_id, talent_assignments_attributes: [:engaged_date, :start_date,:expert_id])
    end
end


