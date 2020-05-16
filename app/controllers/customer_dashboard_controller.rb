class CustomerDashboardController < ApplicationController
  authorize_resource :class => false, only: [:index]
  layout 'admin'

  def index 
    @transactions = current_user.transactions.last(2)
    @talent_assignment = TalentAssignment.with_deleted
  end
  
  def finalized_requests
    @finalized_requests = current_user.finalized_requests.includes(:talent_assignment).where.not(:talent_assignments => {id: nil})
  end

  def show_finalized_request
    @finalized_request = FinalizedRequest.find(params[:id])
    @talent_assignment = @finalized_request.talent_assignment
    @transaction = Transaction.new
  end  

  def my_request
    @requests = current_user.requests.includes(:talent_requests).where.not(:talent_requests => {id: nil})
  end
  
  def show_request
    @request = Request.find(params[:id])
    @talent_requests = @request.talent_requests
  end

  def thank_you
    render :layout => 'confirmation'
  end

  def request_confirmation
     @request = current_or_guest_user.requests.find(params[:id])
     @talent_requests = @request.talent_requests
    render :layout => 'confirmation'
  end
  
end
