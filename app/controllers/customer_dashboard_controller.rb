class CustomerDashboardController < ApplicationController

  def index
    @finalized_requests = current_user.finalized_requests
  end

  def finalized_requests
  end

  def show_finalized_request
  end

  def make_payment_for_finalized_request
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
