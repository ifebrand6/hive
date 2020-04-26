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
    @customers = User.customers
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
    @finalized_request = FinalizedRequest.new
    @finalized_request.build_talent_assignment
  end
  
  def finalize_user_request
      @finalized_request = FinalizedRequest.new(final_params)
      if @finalized_request.save
      flash[:notice] = "Talent Assign successfully"
      redirect_to root_path
    else
      render :talent_assignment
    end
  end

  private

     def final_params
      params.require(:finalized_request).permit(:user_id, :request_id, talent_assignment_attributes: [:engaged_date, :start_date,:expert_id])
    end
end


