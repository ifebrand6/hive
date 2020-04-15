class CustomerDashboardController < ApplicationController

  def index
    @finalized_requests = current_user.finalized_requests
  end

  def finalized_requests
  end

  def show_finalized_request
    @finalized_request = FinalizedRequest.find(params[:id])
    @talent_assignment = @finalized_request.talent_assignment
  end

  def make_payment_for_finalized_request
    @finalized_request = 
    @transaction = Transaction.new
    @profile = @transaction.build_user
  end

  def save_transaction
    
  end
  

  def transactions
  end

  def show_transcation
  end

  def my_request
  end

  def show_request
  end

  def delete_request
  end

  private

end
