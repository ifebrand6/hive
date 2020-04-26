class CustomerDashboardController < ApplicationController

  def index
    @finalized_requests = current_user.finalized_requests
  end

  def finalized_requests
  end

  def show_finalized_request
    @finalized_request = FinalizedRequest.find(params[:id])
    @talent_assignment = @finalized_request.talent_assignment
    @transaction = Transaction.new
  end  
  
  def thank_you
  end
  
end
