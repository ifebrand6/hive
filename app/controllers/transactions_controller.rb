class TransactionsController < ApplicationController
  def index
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save!
      redirect_to thank_you_path
      #TODO SEND MAIL TO CUSTOMER
      flash[:notice] = 'Payment Successful'
    end
  end

  def show
  end

  private
    def transaction_params
      params.require(:transaction).permit(:user_id,:finalized_request_id)
    
    end
end
