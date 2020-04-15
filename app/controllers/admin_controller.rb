class AdminController < ApplicationController
  #skip_before_action :authenticate_user!, :except => []
  before_action :set_talent_request, only: [:talent_assignment,:finalize_user_request]
  before_action :set_user, only: [:customer_requests,:customer_talent_requests]

  def index
  end

  def application
    @expert_application_list = ExpertApplication.all.pending_application
  end

  def talents
    @expert_application_list = ExpertApplication.all.onboard_expert
  end

  def customers_requests
    @customers = User.all
  end


  def customer_requests
    @requests = @user.requests
  end

  def customer_talent_requests
    @talent_requests = @user.talent_requests
  end

  def talent_assignment
    @talents = ExpertApplication.all.where(talent_type: @talent_request.talent_type_id)
    @finalized_request = FinalizedRequest.new
    @finalized_request.build_talent_assignment
  end

# TODO make talent_requests void once a talent is assigned to the request
  def finalize_user_request
      @finalized_request = FinalizedRequest.new(final_params)
        if @finalized_request.save
          SendFinalRequestMailJob.perform_later(@finalized_request.id)
          flash[:notice] = "Talent Assign successfully"
          redirect_to admin_dashboard_path
        else
          render :talent_assignment
        end
  end
  
  private

  def set_talent_request
    @talent_request = TalentRequest.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def final_params
      params.require(:finalized_request).permit(:user_id, :request_id, talent_assignments_attributes: [:engaged_date, :start_date,:expert_application_id])
  end
end


