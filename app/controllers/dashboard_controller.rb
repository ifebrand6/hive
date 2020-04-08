class DashboardController < ApplicationController
  #skip_before_action :authenticate_user!, :except => []

  def index
  end

  def application
    @expert_list = Expert.all.pending_application
  end

  def talents
    @expert_list = Expert.all.onboard_expert
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
    @talent_request = TalentRequest.find(params[:id]) #use to get the TalentRequest and populated to fill in the final request params
    @talents = Expert.all.where(talent_type: @talent_request.talent_type_id)
    @final_request = FinalizedRequest.new
    @final_request.talent_assignments.build
  end
  def finalize_user_request
      @final_request = FinalizedRequest.new(final_params)
      if @final_request.save
      flash[:notice] = "Talent Assign successfully"
      redirect_to root_path
    else
      render :talent_assignment
    end
  end

  private

     def final_params
      params.require(:finalized_request).permit(:user_id, :request_id, talent_assignments_attributes: [:id,:engaged_date, :start_date,:expert_id, :finalized_request, :_destroy])
    end
end


